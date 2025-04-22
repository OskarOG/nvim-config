local standard_opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Space>", "", standard_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map comment line
vim.keymap.set({ "n", "v" }, "<Space>c", ":normal gcc<CR>", standard_opts)

-- Select line after indentation
vim.keymap.set("v", "<", "<gv", standard_opts)
vim.keymap.set("v", ">", ">gv", standard_opts)

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m .+1<CR>==", standard_opts)
vim.keymap.set("v", "K", ":m .-2<CR>==", standard_opts)
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", standard_opts)
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", standard_opts)

-- Quick jump in normal mode
vim.keymap.set("n", "K", "10k", standard_opts)
vim.keymap.set("n", "J", "10j", standard_opts)

-- Remove search highlight on escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", standard_opts)

-- Insert empty line in normal mode
vim.keymap.set("n", "<S-enter>", "O<Esc>", standard_opts)
vim.keymap.set("n", "<enter>", "o<Esc>", standard_opts)

-- Split navigation
vim.keymap.set("n", "C-h>", "<C-w><C-h>", standard_opts)
vim.keymap.set("n", "C-l>", "<C-w><C-l>", standard_opts)
vim.keymap.set("n", "C-j>", "<C-w><C-j>", standard_opts)
vim.keymap.set("n", "C-k>", "<C-w><C-k>", standard_opts)
