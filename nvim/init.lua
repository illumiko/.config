require('plugins') --plugins
require("impatient")
require('GEN.settings') --base settings
require('GEN.keymaps') --keymaps
require('LSP') --Language server xD
require('PLUG.nvimTree') --file manager
require('PLUG.treesitter') --better syntax highlighting
require('PLUG.org')
require('PLUG.completion') --nvim-cmp completion
require('PLUG.luaSnipConf') --Snippet manager
-- require('PLUG.DAP')
-- require('PLUG.barbar') --buffer like tabs
require('PLUG.buffline')
require('PLUG.telescopeConf') --telescope
require('PLUG.comment') --modern commnet plugin
require('PLUG.autopairs')  -- autopair setup
require('PLUG.twilight') -- twilight
require('PLUG.statusBar') -- lualine
require('PLUG.TogTerm') --terminal
--plugin initialization and minimal conf

vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
   --for color preview
   require'colorizer'.setup()
   -- for shading inactive splits
   require'shade'.setup({ overlay_opacity = 80,
    opacity_step = 1,
    -- keys = {
    --   brightness_up    = '<C-Up>',
    --   brightness_down  = '<C-Down>',
    --   toggle           = '<Leader>s',
    -- }
    })

    --highling a range of line
    require'range-highlight'.setup{}


--colorschemes
  --gruvbox-material

    --[[ vim.g.gruvbox_baby_function_style = "NONE"
    vim.g.gruvbox_baby_keyword_style = "italic"
    vim.cmd[[colorscheme gruvbox-baby]]
    --]]
--

  -- onedark
    -- require('PLUG.onedark')

  -- vscode dark

    -- vim.g.vscode_style = 'dark'
    -- vim.api.nvim_command('colorscheme vscode')

  --tokyo night
    -- vim.g.tokyonight_style = 'storm'
    -- vim.cmd[[colorscheme tokyonight]]

  --kangawa
  vim.cmd("colorscheme kanagawa")

  -- vim.cmd('hi Normal guibg=NONE')

