-- configs/whichkey.lua

return function()
	local wk = require("which-key")

	wk.setup({
		plugins = {
			spelling = true,
		},
		window = {
			border = "rounded",
		},
		ignore_missing = true,
	})

	wk.register({
		f = { name = "File" },
		g = { name = "Git" },
	}, { prefix = "<leader>" })
end
