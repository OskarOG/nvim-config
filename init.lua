require "user.bootstrap-lazy"

-- ---------------------------------------------------vim.opt-------------------------------------------------------
-- set global clipboard
-- TODO: Learn how to work with vim clipboard
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

require "user.map_leader"
require "user.standard_keymaps"

if vim.g.vscode then
    require "user.vscode_keymaps"
else
    -- neovim conf
end

require "user.setup-lazy"

-- setup plugins
require "user.setup-hop"