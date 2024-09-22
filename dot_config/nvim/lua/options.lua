---@diagnostic disable: undefined-global

-- disable mouse
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI Config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- diagnostic
vim.diagnostic.config({
	virtual_text = false,
})
