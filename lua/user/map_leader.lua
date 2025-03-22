local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader config
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "