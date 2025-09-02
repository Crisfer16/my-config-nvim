-- ~/.config/nvim/lua/formating.lua
local M = {}

M.formatters_by_ft = {
  lua = { "stylua" },
  python = { "black" },
  sh = { "shfmt" },
  bash = { "shfmt" },
}

M.format_on_save = {
  lsp_fallback = true,
  timeout_ms = 500,
}


-- Mapeo manual para formatear
vim.keymap.set("n", "<space>f", function()
  require("conform").format({ 
    async = true, 
    lsp_fallback = true 
  })
end, { desc = "Formatear con conform" })

return M
