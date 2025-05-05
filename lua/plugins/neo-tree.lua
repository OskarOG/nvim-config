return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		filesystem = {
			window = {
				mappings = {
					["P"] = "easy_dotnet_project",
					["F"] = "easy_dotnet_file",
				},
			},
			commands = {
				["easy_dotnet_project"] = function(state)
					local node = state.tree:get_node()
					local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
					require("easy-dotnet").new(path, function()
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,
				["easy_dotnet_file"] = function(state)
					local node = state.tree:get_node()
					local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
					require("easy-dotnet").createfile(path, function()
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,
			},
		},
	},
	keys = {
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Neotree toggle filesystem float<cr>",
			desc = "Open neo tree filesystem",
		},
		{
			"<leader>g",
			mode = { "n", "v" },
			"<cmd>Neotree toggle git_status float<cr>",
			desc = "Open neo tree git status",
		},
	},
}
