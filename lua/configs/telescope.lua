local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<C-q>"] = require("telescope.actions").send_to_qflist },
    },
  },
})

-- keymaps propios de telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto" })
