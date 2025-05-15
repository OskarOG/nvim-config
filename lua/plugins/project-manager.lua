local projects
if require("easy-dotnet.extensions").isWindows() then
	projects = {
		-- "C:\\Users\\aoskgee\\AppData\\Local\\nvim",
		"C:\\repos\\*",
	}
else
	projects = {
		"~/repos/*",
		"~/projects/*",
		"~/.config/nvim",
	}
end

return {
	"coffebar/neovim-project",
	opts = {
		projects = projects,
		picker = {
			type = "telescope",
		},
	},
	keys = {
		{
			"<leader>po",
			":NeovimProjectDiscover<CR>",
			desc = "Project Manager: Discover",
		},
	},
	init = function()
		vim.opt.sessionoptions:append("globals")
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{
			"Shatur/neovim-session-manager",
			opts = {},
		},
	},
	lazy = false,
	priority = 100,
}
