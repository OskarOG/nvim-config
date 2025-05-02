require("config.keymaps")

if vim.fn.executable("ya") == 0 or vim.fn.executable("yazi") == 0 then
	vim.env.PATH = vim.env.PATH .. ":/home/oskarg/Applications/yazi/bin/"
end

if vim.g.vscode then
	require("config.vscode.keymaps")
else
	require("config.lazy")
	require("config.nvim.opt_setup")
	require("config.nvim.highlight_on_yank")
	require("config.nvim.dotnet_debug")
end
