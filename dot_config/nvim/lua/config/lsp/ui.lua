---@diagnostic disable: undefined-global

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})

local signs = {
	Error = "󰅙",
	Info = "󰋼",
	Hint = "󰛨",
	Warn = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
