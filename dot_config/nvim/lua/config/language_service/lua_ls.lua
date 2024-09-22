---@diagnostic disable:undefined-global

function LspKeybind(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keybindings").mapLSP(buf_set_keymap)
end

local nlsp_status, nvim_lsp = pcall(require, "lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

if not nlsp_status then
	vim.notify("没有找到 lspconfig")
	return
end

-- Rust
nvim_lsp.rust_analyzer.setup({})

-- Java
nvim_lsp.jdtls.setup({})

--- Lua_ls
nvim_lsp.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name

		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						library = { vim.env.VIMRUNTIME },
					},
				},
			})
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
	on_attach = LspKeybind,
	capabilities = capabilities,
})

-- Kotlin LSP
nvim_lsp.kotlin_language_server.setup({
	capabilities = capabilities,
})

-- CSharp_ls
nvim_lsp.csharp_ls.setup({
	capabilities = capabilities,
})

-- Taplo (TOML Language Server)
nvim_lsp.taplo.setup({
	capabilities = capabilities,
})

-- Hyprlang LSP (不知道什么原因，无法使用lspconfig)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function(event)
		print(string.format("starting hyprls for %s", vim.inspect(event)))
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
