---@diagnostic disable: undefined-global

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/waybar/config"] = "jsonc",
	},
	extension = {
		["http"] = "http",
	},
})
