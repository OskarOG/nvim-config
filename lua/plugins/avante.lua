return {
	"yetone/avante.nvim",
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"zbirenbaum/copilot.lua",
		"folke/snacks.nvim",
		"stevearc/dressing.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "Avante" },
			opts = { file_types = { "markdown", "Avante" } },
		},
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_filename = false,
					drag_and_drop = { insert_mode = true },
					use_absolute_path = true,
				},
			},
		},
	},

	--@module "avante"
	--@type avante.Config
	opts = {
		instruction_file = "agentfile.md",
		provider = "copilot",
		providers = {
			copilot = {
				model = "gpt-4o-mini",
				timeout = 30000, -- ms
			},
		},
	},
}
