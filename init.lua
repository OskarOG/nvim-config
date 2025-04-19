require("config.keymaps")

if vim.g.vscode then
    require("config.vscode.keymaps")
else
    require("config.lazy")
    require("config.nvim.opt_setup")
    require("config.nvim.highlight_on_yank")
end
