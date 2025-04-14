vim.g.have_nerd_font = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set side line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse in all modes for nvim
vim.opt.mouse = "a"

-- Smart line indentation, makes long lines follow indentation instead of starting at base
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Use "sign" column
vim.opt.signcolumn = "yes"

-- Decrease times
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set list char in editor to display separation (TODO: Could hinder other symbol lines in editor)
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show line
vim.opt.cursorline = true

-- Set tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Number of lines that should always be displayed at top and bottom
vim.opt.scrolloff = 5
