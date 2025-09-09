-- fichero de configuracion de bufferlibe.nvim
return function()
	require("bufferline").setup({
		options = {
			mode = "buffers",
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			show_buffer_close_icons = true,
			show_close_icon = false,
		},
	})
end
