-- config mason
require("mason").setup()

-- Configuracion LSP (declararemos los LSP que necesitamos)
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls", -- LSP para bash
  },
  automatic_installation = true,
})
print("Bloque LSP leido por NeoVim")

-- Configuracion DAP (declaramos los debuger que necesitamos)
require("mason-nvim-dap").setup({
  ensrure_installed = {
    
  },
  automatic_installation = false,
})
print("Bloque LSP leido por NeoVim")

