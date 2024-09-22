return {
	{
		"mfussenegger/nvim-lint",
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
		config = function()
			require("lint").linter_by_ft = {
				markdown = { "vale" },
				json = { "jsonlint" },
				lua = { "selene" },
				terraform = { "tflint" },
			}
		end,
	},
}
