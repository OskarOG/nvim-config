return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local easy_dotnet = require("easy-dotnet")
		easy_dotnet.setup({
			picker = "telescope",
		})

		-- vim.api.nvim_create_user_command("Secrets", function()
		-- easy_dotnet.secrets()
		-- end, {})

		-- vim.keymap.set("n", "C-p>", function()
		-- easy_dotnet.run_project()
		-- end, { desc = "Dotnet: Run project" })

		-- vim.keymap.set("n", "<C-n>", function()
		-- easy_dotnet.new()
		-- end, { desc = "Dotnet: New project" })

		-- vim.keymap.set("n", "<C-a>", function()
		-- easy_dotnet.createfile()
		-- end, { desc = "Dotnet: New file" })
	end,
}
