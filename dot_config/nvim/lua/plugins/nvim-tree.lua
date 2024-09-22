---@diagnostic disable: undefined-global

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_cursor = true,
		view = {
			side = "right",
			width = 40,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},
		renderer = {
			highlight_diagnostics = "icon",
		},
		sort_by = function(nodes)
			local function natural_cmp(left, right)
				if left.type ~= "directory" and right.type == "directory" then
					return false
				elseif left.type == "directory" and right.type ~= "directory" then
					return true
				end

				left = left.name:lower()
				right = right.name:lower()

				if left == right then
					return false
				end

				for i = 1, math.max(string.len(left), string.len(right)), 1 do
					local l = string.sub(left, i, -1)
					local r = string.sub(right, i, -1)

					if
						type(tonumber(string.sub(l, 1, 1))) == "number"
						and type(tonumber(string.sub(r, 1, 1))) == "number"
					then
						local l_number = tonumber(string.match(l, "^[0-9]+"))
						local r_number = tonumber(string.match(r, "^[0-9]+"))

						if l_number ~= r_number then
							return l_number < r_number
						end
					elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
						return l < r
					end
				end
			end

			table.sort(nodes, natural_cmp)
		end,
		on_attach = function(bnfnr)
			local api = require("nvim-tree.api")

			api.config.mappings.default_on_attach(bnfnr)

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bnfnr, noremap = true, silent = true, nowait = true }
			end

			local function edit_or_open()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file
					api.node.open.edit()
					-- Close the tree if file was opened
					api.tree.close()
				end
			end

			local function vsplit_preview()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file as vsplit
					api.node.open.vertical()
				end

				-- Finally refocus on tree if it was lost
				api.tree.focus()
			end

			vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
			vim.keymap.set("n", "L", edit_or_open, opts("Vsplit Preview"))
			vim.keymap.set("n", "h", api.tree.close, opts("Vsplit Preview"))
			vim.keymap.set("n", "H", api.tree.collapse_all, opts("Vsplit Preview"))
		end,
	},
}
