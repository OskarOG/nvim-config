return {
	"coffebar/neovim-project",
	opts = {
		projects = {
			"~/repos/*",
			"~/projects/*",
			"~/.config/nvim",
		},
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
		{ "Shatur/neovim-session-manager", opts = {} },
	},
	lazy = false,
	priority = 100,
}
