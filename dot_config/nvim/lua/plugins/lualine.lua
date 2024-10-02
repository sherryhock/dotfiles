return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				disabled_filetypes = { "NvimTree", "toggleterm", "dbee" },
				theme = "catppuccin",
			},
			sections = {
				lualine_x = { "aerial" },
				lualine_y = {
					"aerial",
					sep = " ) ",
					depth = nil,
					dense = false,
					dense_sep = ".",
					colored = true,
				},
			},
		},
	},
}
