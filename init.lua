local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader config
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ---------------------------------------------------vim.opt-------------------------------------------------------

-- set global clipboard
-- vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- --------------------------------------------------keymaps---------------------------------------------------------
require "user.standard_keymaps"

if vim.g.vscode then
    require "user.vscode_keymaps"
else
    -- neovim conf
end
