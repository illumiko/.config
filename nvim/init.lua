require('plugins') --plugins
require("impatient")
require('general.settings') --base settings
require('general.keymaps') --keymaps
require('LSP') --Language server xD
--require('plugin.nvimTree') --file manager
require('plugin.treesitter') --better syntax highlighting
require('plugin.org')
require('plugin.completion') --nvim-cmp completion
require('plugin.luaSnipConf') --Snippet manager
-- require('plugin.DAP')
-- require('plugin.barbar') --buffer like tabs
require('plugin.buffline')
require('plugin.telescopeConf') --telescope
require('plugin.comment') --modern commnet plugin
require('plugin.autopairs')  -- autopair setup
require('plugin.twilight') -- twilight
require('plugin.statusBar') -- lualine
require('plugin.TogTerm') --terminal
require('general.colorscheme')
--plugin initialization and minimal conf

   --for color preview
   require'colorizer'.setup()
   -- for shading inactive splits
   require'shade'.setup({ 
    overlay_opacity = 45,
    opacity_step = 1,
    -- keys = {
    --   brightness_up    = '<C-Up>',
    --   brightness_down  = '<C-Down>',
    --   toggle           = '<Leader>s',
    -- }
    })

    --highling a range of line
    require'range-highlight'.setup{}
