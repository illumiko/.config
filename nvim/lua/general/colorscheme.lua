--colorschemes
  --gruvbox-material

    --[[ vim.g.gruvbox_baby_function_style = "NONE"
    vim.g.gruvbox_baby_keyword_style = "italic"
    vim.cmd[[colorscheme gruvbox-baby]]
    --]]
--

  -- onedark
    -- require('plugin.onedark')

  -- vscode dark

    -- vim.g.vscode_style = 'dark'
    -- vim.api.nvim_command('colorscheme vscode')

  --tokyo night
    -- vim.g.tokyonight_style = 'storm'
    -- vim.cmd[[colorscheme tokyonight]]

  --kangawa
  -- vim.cmd("colorscheme kanagawa")

  -- vim.cmd('hi Normal guibg=NONE')

  -- nightfox
  require('nightfox').load()
