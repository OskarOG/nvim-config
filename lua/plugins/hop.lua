return {
	"smoka7/hop.nvim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })

		local directions = require("hop.hint").HintDirection

		vim.keymap.set({ "n", "v", "o" }, "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })

		vim.keymap.set({ "n", "v", "o" }, "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })

		vim.keymap.set({ "n", "v", "o" }, "t", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, { remap = true })

		vim.keymap.set({ "n", "v", "o" }, "T", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, { remap = true })

		vim.keymap.set({ "n", "v" }, "<leader>w", function()
			hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end, { remap = true })

		vim.keymap.set({ "n", "v" }, "<leader>W", function()
			hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
		end, { remap = true })
	end,
}
