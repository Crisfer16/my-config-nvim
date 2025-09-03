-- config mason
require("mason").setup()

-- Configuracion LSP (declararemos los LSP que necesitamos)
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"lua_ls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
	automatic_installation = true,
})
-- print("Bloque LSP leido por NeoVim")

-- Configuracion DAP (declaramos los debuger que necesitamos)
require("mason-nvim-dap").setup({
	ensure_installed = {},
	automatic_installation = false,
})
-- print("Bloque LSP leido por NeoVim")

-- Configuracion de Formatters (declaramos los Formatters que necesitamos)
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"shfmt",
		"shellharden",
	},
	run_on_start = true,
	auto_update = false,
})
