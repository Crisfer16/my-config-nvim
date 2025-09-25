-- lua/configs/dap/python.lua
local M = {}

function M.setup(dap)
	dap = dap or require("dap")

	-- detectar debugpy: preferir instalación de Mason, luego venv del proyecto, luego system python
	local mason_dbgpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
	local dbgpy_path = nil
	if vim.fn.executable(mason_dbgpy) == 1 then
		dbgpy_path = mason_dbgpy
	end

	local function detect_python_fallback()
		if dbgpy_path then
			return dbgpy_path
		end
		local venv = os.getenv("VIRTUAL_ENV")
		if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
			return venv .. "/bin/python"
		end
		local sys_python = "/usr/bin/python3"
		if vim.fn.executable(sys_python) == 1 then
			return sys_python
		end
		return "python"
	end

	-- nvim-dap-python (helpers)
	local ok_dap_python, dap_python = pcall(require, "dap-python")
	if ok_dap_python then
		dap_python.setup(dbgpy_path or detect_python_fallback())
	end

	-- adaptador explícito para Python (debugpy)
	dap.adapters.python = {
		type = "executable",
		command = dbgpy_path or detect_python_fallback(),
		args = { "-m", "debugpy.adapter" },
	}

	-- launch configurations para Python
	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Run current file",
			program = "${file}",
			pythonPath = function()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
					return venv .. "/bin/python"
				end
				local poetry_env = vim.fn.trim(vim.fn.system("poetry env info -p 2>/dev/null"))
				if poetry_env ~= "" and vim.fn.isdirectory(poetry_env) == 1 then
					return poetry_env .. "/bin/python"
				end
				return dbgpy_path or detect_python_fallback()
			end,
		},
		{
			type = "python",
			request = "launch",
			name = "Run module",
			module = "module",
			pythonPath = function()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
					return venv .. "/bin/python"
				end
				return dbgpy_path or detect_python_fallback()
			end,
		},
		{
			type = "python",
			request = "launch",
			name = "pytest (current file)",
			module = "pytest",
			args = { "${file}" },
			pythonPath = function()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
					return venv .. "/bin/python"
				end
				return dbgpy_path or detect_python_fallback()
			end,
		},
		{
			type = "python",
			request = "attach",
			name = "Attach to process (pick)",
			processId = require("dap.utils").pick_process,
			pythonPath = function()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
					return venv .. "/bin/python"
				end
				return dbgpy_path or detect_python_fallback()
			end,
		},
	}
end

return M
