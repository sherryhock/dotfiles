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
				aerial = {
					-- How to format the symbols
					format_symbol = function(symbol_path, filetype)
						if filetype == "json" or filetype == "yaml" then
							return table.concat(symbol_path, ".")
						else
							return symbol_path[#symbol_path]
						end
					end,
					-- Available modes: symbols, lines, both
					show_columns = "both",
				},
			},
		},
	},
}
