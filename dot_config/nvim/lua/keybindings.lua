---@diagnostic disable: undefined-global

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- 插件快捷键
local pluginKeys = {}

-- kulala(http)
map("n", "<C-k>", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
map("n", "<C-l>", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })

-- nvim-tree
-- smart toggle
local nvimTreeFocusOrToggle = function()
	local nvimTree = require("nvim-tree.api")
	local currentBuf = vim.api.nvim_get_current_buf()
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle()
	else
		nvimTree.tree.focus()
	end
end

map("n", "<A-m>", nvimTreeFocusOrToggle, opt)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffer<CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)

-- tiny-code-action
map("n", "<leader>ca", function()
	require("tiny-code-action").code_action()
end, opt)

-- aerial
map("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- inc-rename
map("n", "<leader>rn", ":IncRename ")

-- LSP
pluginKeys.mapLSP = function(mapbuf)
	-- go xx
	mapbuf("n", "gd", ":Lspsaga goto_definition<CR>", opt)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

	mapbuf("n", "<leader>=", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opt)
	-- 没用到
	mapbuf("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)
end

return pluginKeys
