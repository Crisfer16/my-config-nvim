-- Config fichero lspconfig.lua

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Integramos la extension CMP (quitar el comentario cuando la tengamos configurada)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Funcion para adjuntar un LSP a un buffer
local on_attach = function(client, bufnr)
	-- mostramos un print para verificar que el LSP esta funcionando
	print("LSP funcionando correctamente:" .. client.name)
end

local default_config = {
	on_attach = on_attach,
	capabilities = capabilities,
}

local servers = {
	bashls = { filetypes = { "sh", "bash" } },
	lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
	pyright = {
		settings = {
			python = {
				analysis = { typeCheckingMode = "strict", autoSearchPaths = true, useLibraryCodeForTypes = true },
			},
		},
	},
	-- aqui pondremos mas config de lsp personalizadas
}

-- lista de herramientas que no son lsp.
local ignore = { stylua = true }

-- recorremos todos los LSP istalados y configurados.
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
	if not ignore[server] then
		local opts = vim.tbl_deep_extend("force", default_config, servers[server] or {})
		lspconfig[server].setup(opts)
	end
end
