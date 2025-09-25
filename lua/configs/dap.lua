-- lua/configs/dap.lua
local M = {}

function M.setup()
	local ok_dap, dap = pcall(require, "dap")
	if not ok_dap then
		return
	end
end

-- DAP-UI (global/shared)
local ok_dapui, dapui = pcall(require, "dapui")
if ok_dapui then
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

-- cargamos configuración de dap para los lengiajes configurado en dap/
pcall(function()
	require("configs.dap.python").setup(dap)
	-- aqui añadiremos los ficheros de los diferentes dap
end)

-- log para depuración, por si necesitamos ver lo que sucede en nvim-dap
--requiere("dap").set_log_level("info")

M.setup()
return M
