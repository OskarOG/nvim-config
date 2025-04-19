return {
	"oskarrrrrrr/symbols.nvim",
	version = "*",
	cmd = { "Symbols", "SymbolsToggle", "SymbolsOpen", "SymbolsClose" },
	keys = {
		{ "<Leader>so", "<cmd>Symbols<CR>", "Open symbols" },
	},
	config = function()
		local recipes = require("symbols.recipes")
		require("symbols").setup(recipes.DefaultFilters, recipes.AsciiSymbols, {})
	end,
}
