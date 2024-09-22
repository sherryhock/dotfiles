require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "hyprlang" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
