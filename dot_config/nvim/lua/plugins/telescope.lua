return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			extensions = {
				persisted = {
					layout_config = { width = 0.55, height = 0.55 },
				},
			},
		},
	},
}
