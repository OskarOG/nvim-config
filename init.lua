require "user.bootstrap-lazy"

-- ---------------------------------------------------vim.opt-------------------------------------------------------
-- set global clipboard
-- vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

require "user.map_leader"
require "user.standard_keymaps"

if vim.g.vscode then
    require "user.vscode_keymaps"

    require "user.setup-vscode-lazy"

    -- setup plugins
    require "user.setup-hop"
else
    -- neovim conf
    vim.g.have_nerd_font = true

    -- Set numbers
    vim.opt.number = true
    vim.opt.relativenumber = true

    -- Enable mouse mode (TODO: Investigate what this does?)
    vim.opt.mouse = 'a'

    -- Smart line indention, makes long lines follow indentation instead of starting at base char on next
    vim.opt.breakindent = true

    -- Save undo history
    vim.opt.undofile = true

    -- Use "sign" column on the left
    vim.opt.signcolumn = 'yes'

    -- Decrease update time
    vim.opt.updatetime = 250

    -- Decrease mapped sequence wait time
    vim.opt.timeoutlen = 300

    vim.opt.splitright = true
    vim.opt.splitbelow = true

    -- Sets how neovim will display certain whitespace characters in the editor.
    --  See `:help 'list'`
    --  and `:help 'listchars'`
    vim.opt.list = true
    vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

    -- Preview substitutions live
    vim.opt.inccommand = 'split'

    -- Show line
    vim.opt.cursorline = true

    -- Set tab width
    vim.opt.tabstop=4
    vim.opt.softtabstop=4
    vim.opt.shiftwidth=4
    vim.opt.expandtab=true


    -- Number of lines that should be displayed before cursor
    vim.opt.scrolloff = 5

    vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function ()
	    vim.highlight.on_yank()
	end,
    })

    require "user.setup-lazy"

    -- setup plugins
    require "user.setup-hop"
end

