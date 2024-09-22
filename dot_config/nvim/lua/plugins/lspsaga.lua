return {
	"nvimdev/lspsaga.nvim",
	enabled = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lightbulb = {
			enable = false,
			sign = true,
			virtual_text = true,
			debounce = 10,
			sign_priotity = 40,
		},
		outline = {
			auto_preview = false,
		},
		hover = {
			open_cmd = "!librewolf",
		},
		ui = {
			code_action = "",
		},
		breadcrumbs = {
			enable = false,
		},
	},
}
