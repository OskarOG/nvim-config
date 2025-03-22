local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- select line after indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move selected lines up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- centered up and down movement
keymap({ "n" }, "K", "10k", opts)
keymap({ "n" }, "J", "10j", opts)

-- remove highlights on escape
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)