-- opciones para nvim

vim.o.number = true
-- vim.o.relativenumber = true
vim.o.termguicolors = true

-- deshabilitamos para que no herede el comentario en la siguiente línea
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- configuración para utilizar clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- cargamos el modulo de lazy
require("base.plugins.lazy")
-- cargamos los keymaps personalizados
require("configs.MappingPropio")
