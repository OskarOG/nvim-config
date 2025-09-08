return {
	-- "github/copilot.vim",
	-- event = "InsertEnter",
	-- init = function()
	-- vim.g.copilot_no_tab_map = true -- disable default <Tab> mapping
	-- vim.g.copilot_assume_mapped = true -- prevent warning message
	-- vim.g.copilot_filetypes = {
	-- ["*"] = true, -- enable for all filetypes
	-- }
	-- end,
	-- config = function()
	-- vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	-- vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Next()", { silent = true, expr = true })
	-- vim.api.nvim_set_keymap("i", "<C-h>", "copilot#Previous()", { silent = true, expr = true })
	-- vim.api.nvim_set_keymap("i", "<C-n>", "copilot#Dismiss()", { silent = true, expr = true })

	-- Enable copilot
	-- vim.cmd("Copilot enable")
	-- end,

	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "InsertEnter", -- optional but works well
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true, -- enable auto popup
			debounce = 75, -- debounce time for auto popup
			keymap = {
				accept = "<C-j>",
				next = "<M-l>",
				prev = "<M-h>",
				dismiss = "<C-n>",
			},
		},
		panel = { enabled = false }, -- optional: disable side panel, handled by avante
		filetypes = {
			["*"] = true, -- enable for all filetypes
		},
	},
}
