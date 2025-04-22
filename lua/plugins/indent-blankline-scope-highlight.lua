return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			highlight = { "Function", "Label" },
			include = { node_type = { ["lua"] = { "table_constructor", "block", "function" } } },
		},
	},
}
