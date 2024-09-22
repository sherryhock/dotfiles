---@diagnostic disable: undefined-global

return {
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	opts = {},
	-- },

	-- LspConfig
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	opts = {
	-- 		ensure_installed = { "lua_ls", "csharp_ls", "taplo" },
	-- 	},
	-- },

	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		require("config.language_service.lua_ls")
	-- 		require("config.lsp.ui")
	-- 	end,
	-- },

	-- Conform
	-- {
	-- 	"zapling/mason-conform.nvim",
	-- 	opts = {},
	-- },

	-- nvim-lint
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd({ "BUfWritePost" }, {
	-- 			callback = function()
	-- 				require("lint").try_lint()
	-- 			end,
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"rshkarin/mason-nvim-lint",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-lint",
	-- 		"williamboman/mason.nvim",
	-- 	},
	-- 	opts = {
	-- 		ensure_installed = { "selene" },
	-- 	},
	-- },
}
