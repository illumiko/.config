require('plugins') --plugins
require("impatient")
require('general.settings') --base settings
require('general.keymaps') --keymaps
require('LSP') --Language server xD
--require('plugin.nvimTree') --file manager
-- require('plugin.barbar') --buffer like tabs
require('plugin.treesitter') --better syntax highlighting
require('plugin.org')
require('plugin.completion') --nvim-cmp completion
require('plugin.luasnip_conf') --Snippet manager
-- require('plugin.DAP')
-- require('plugin.buffline')
require('plugin.telescope_conf') --telescope
require('plugin.comment') --modern commnet plugin
require('plugin.autopairs')  -- autopair setup
require('plugin.status_bar') -- lualine
require('plugin.tog_term') --terminal
require('plugin.git_signs') --git signs
require("format.format")
require('general.colorscheme')
if(vim.g.neovide) then
    vim.cmd([[
        set guifont=Comic\ Code\ Ligatures:h13
    ]])
    vim.g.neovide_transparency = 0.6
end
