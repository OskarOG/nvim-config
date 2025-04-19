return {
	"theprimeagen/harpoon",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add file to harpoon",
		},
		{
			"<leader>hh",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Navigate to file 1 in harpoon",
		},
		{
			"<leader>h2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Navigate to file 2 in harpoon",
		},
		{
			"<leader>h3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Navigate to file 3 in harpoon",
		},
		{
			"<leader>h4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Navigate to file 4 in harpoon",
		},
		{
			"<leader>h5",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			desc = "Navigate to file 4 in harpoon",
		},
		{
			"<leader>h6",
			function()
				require("harpoon.ui").nav_file(6)
			end,
			desc = "Navigate to file 4 in harpoon",
		},
		{
			"<leader>h7",
			function()
				require("harpoon.ui").nav_file(7)
			end,
			desc = "Navigate to file 4 in harpoon",
		},
		{
			"<leader>h8",
			function()
				require("harpoon.ui").nav_file(8)
			end,
			desc = "Navigate to file 4 in harpoon",
		},
		{
			"<leader>h9",
			function()
				require("harpoon.ui").nav_file(9)
			end,
			desc = "Navigate to file 4 in harpoon",
		},
	},
}
