local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader config
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ---------------------------------------------------vim.opt-------------------------------------------------------

-- set global clipboard
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- --------------------------------------------------keymaps---------------------------------------------------------

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

if vim.g.vscode then
    -- vscode commands
    keymap({ "n", "v" }, "<leader>vt", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
    keymap({ "n", "v" }, "<leader>vp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
    keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
    keymap({ "n", "v" }, "<leader>i", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
    keymap({ "n", "v" }, "<leader>f", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
    keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
    keymap({ "n", "v" }, "<leader>c", "<cmd>lua require('vscode').action('editor.action.commentLine')<CR>")

    -- dotnet
    keymap({ "n", "v" }, "<leader>db", "<cmd>lua require('vscode').action('csdevkit.buildSolution')<CR>")

    -- test
    -- workbench.view.testing.focus
    keymap({ "n", "v" }, "<leader>rat", "<cmd>lua require('vscode').action('testing.runAll')<CR><cmd>lua require('vscode').action('workbench.view.testing.focus')<CR>")
    keymap({ "n", "v" }, "<leader>rtc", "<cmd>lua require('vscode').action('dotnet.test.runTestsInContext')<CR><cmd>lua require('vscode').action('workbench.view.testing.focus')<CR>")
    keymap({ "n", "v" }, "<leader>dtc", "<cmd>lua require('vscode').action('dotnet.test.debugTestsInContext')<CR><cmd>lua require('vscode').action('workbench.view.testing.focus')<CR>")

    -- harpoon setup
    keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
    keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
    keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
    keymap({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
    keymap({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
    keymap({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
    keymap({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
    keymap({ "n", "v" }, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
    keymap({ "n", "v" }, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
    keymap({ "n", "v" }, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
    keymap({ "n", "v" }, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
    keymap({ "n", "v" }, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

    -- project manager keymaps
    keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
    keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
    keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
else
    -- neovim conf
end
