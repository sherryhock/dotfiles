return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				disabled_filetypes = { "NvimTree", "toggleterm", "dbee" },
				theme = "catppuccin",
			},
		},
	},
}
