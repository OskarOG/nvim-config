return {
	{
		"MeanderingProgrammer/render-markdown.nvim",

		ft = { "markdown" },

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			enabled = true,

			file_types = {
				"markdown",
			},

			completions = {
				lsp = {
					enabled = true,
				},
			},

			code = {
				enabled = true,
				sign = true,
				width = "block",
				right_pad = 1,
			},

			heading = {
				enabled = true,
			},

			pipe_table = {
				enabled = true,
				preset = "round",
			},

			checkbox = {
				enabled = true,
			},
		},

		keys = {
			{
				"<leader>mp",
				"<cmd>RenderMarkdown preview<cr>",
				desc = "Markdown Preview",
			},
			{
				"<leader>mt",
				"<cmd>RenderMarkdown toggle<cr>",
				desc = "Toggle Markdown Rendering",
			},
		},
	},
}
