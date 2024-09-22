if vim.g.neovide then
	vim.o.guifont = "monolisa variable:h14"
	vim.g.neovide_scale_factor = 0.9

	-- padding
	vim.g.neovide_padding_top = 8
	vim.g.neovide_padding_bottom = 8
	vim.g.neovide_padding_right = 8
	vim.g.neovide_padding_left = 8

	-- transparency
	vim.g.neovide_transparency = 0.7
end

-- 加载通用配置
require("options")

-- 加载文件类型配置
require("filetype")

-- 加载按键映射
require("keybindings")

-- 加载插件管理器
require("config.lazy")

-- 设置主题
require("colorscheme")

--require('plugins-config.nvim-tree')
