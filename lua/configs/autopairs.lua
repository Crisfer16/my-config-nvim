-- configs/autopairs, configuración de la extensions

local autopairs = require("nvim-autopairs")

autopairs.setup({
	check_ts = true,
	disabled_filetypes = { "TelescopePrompt", "vim" },
})
