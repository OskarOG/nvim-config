return {
	"zbirenbaum/copilot.lua",
	lazy = false,
	event = "InsertEnter", -- optional but works well
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true, -- enable auto popup
				keymap = {
					accept = "<C-J>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = { enabled = false }, -- optional: disable side panel
		})
	end,
}
