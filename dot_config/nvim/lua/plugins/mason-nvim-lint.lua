return {
	{
		"rshkarin/mason-nvim-lint",
		enabled = false,
		dependencies = {
			"mfussenegger/nvim-lint",
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = { "selene" },
		},
	},
}
