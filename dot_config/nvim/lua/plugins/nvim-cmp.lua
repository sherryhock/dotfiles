---@diagnostic disable: undefined-global

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"MattiasMTS/cmp-dbee",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
}
