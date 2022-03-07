local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall 
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
  --transparent nvim
  use 'xiyaowong/nvim-transparent'
  -- use 'tribela/vim-transparent'
	use {
    'lewis6991/impatient.nvim',
    lock=true,
    config = {
      -- Move to lua dir so impatient.nvim can cache it
      compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
    }
	}
    use {
      "wbthomason/packer.nvim",
      lock=true
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    --debugging
    use {
      'mfussenegger/nvim-dap',
      -- "Pocco81/DAPInstall.nvim",
      -- {"microsoft/vscode-js-debug", ft = {'js', 'vue'} }
    }
    use {"mfussenegger/nvim-dap-python"} -- python

    --vim wiki
    -- use {
    --   'lervag/wiki.vim',
    --   requires = {'lervag/wiki-ft.vim'},
    --   config = function ()
    --     vim.cmd[[let g:wiki_root = '~/Documents/viki']]
    --   end
    -- }
    --neo org
    use {
      "nvim-neorg/neorg",
      commit = '81326c6f8f2dac905f247d79593a2bf17e656b80',
      lock=true,
      -- commit='b0b2d07d0ffb25eebc102487a5d0f2b70fa7427e',
      requires = "nvim-lua/plenary.nvim",
    }

    --discord rich presence
    use{
      'andweeb/presence.nvim',
      lock=true,
      config = function ()
        require("presence"):setup({
          -- General options
          auto_update         = true,
          neovim_image_text   = "The One True Text Editor",
          main_image          = "neovim",
          client_id           = "793271441293967371",
          log_level           = nil,
          debounce_timeout    = 10,
          enable_line_number  = false, 
          blacklist           = {},
          buttons             = true,
          -- Rich Presence text options
          editing_text        = "Editing %s",
          file_explorer_text  = "Browsing %s",
          git_commit_text     = "Committing changes",
          plugin_manager_text = "Managing plugins",
          reading_text        = "Reading %s",
          workspace_text      = "Working on %s",
          line_number_text    = "Line %s out of %s",
        })
      end
    } 
    --Lsp Progress
    use {
      'j-hui/fidget.nvim',
      config = function ()
        require"fidget".setup{}
      end
    }
    --use 'windwp/nvim-ts-autotag' --autocompletes html tags

    --nvim greeter
    use {
      "goolord/alpha-nvim",
      lock=true,
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
          local alpha = require'alpha'
          local dashboard = require'alpha.themes.startify'
          dashboard.section.header.val = {
              [[⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
              [[⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
              [[⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕]],
              [[⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕]],
              [[⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑]],
              [[⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐]],
              [[⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐]],
              [[⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔]],
              [[⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕]],
              [[⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕]],
              [[⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕]],
              [[⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕]],
              [[⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁]],
              [[⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿]],
          }
          -- dashboard.section.top_buttons.val = {
          --     dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
          -- }
          -- disable MRU
          -- dashboard.section.mru.val = { { type = "padding", val = 0 } }
          -- disable MRU cwd
          -- dashboard.section.mru_cwd.val = { { type = "padding", val = 0 } }
          -- disable nvim_web_devicons
          -- dashboard.nvim_web_devicons.enabled = false
          -- dashboard.nvim_web_devicons.highlight = false
          -- dashboard.nvim_web_devicons.highlight = 'Keyword'
          --
          -- dashboard.section.bottom_buttons.val = {
          --     dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
          -- }
          -- dashboard.section.footer = {
          --     { type = "text", val = "footer" },
          -- }
          -- ignore filetypes in MRU
          -- dashboard.mru_opts.ignore = function(path, ext)
          --     return
          --             (string.find(path, "COMMIT_EDITMSG"))
          --         or  (vim.tbl_contains(default_mru_ignore, ext))
          -- end
          alpha.setup(dashboard.opts)
      end
    }
    

  -- nvim terminal
    use {
      'akinsho/toggleterm.nvim',
      lock=true,
    }
  
  --zenMode
    use {
      "folke/zen-mode.nvim",
      "folke/twilight.nvim",
      lock=true,
    }
  --lua functions for nvim
    use {
      "nvim-lua/popup.nvim",
      lock=true,
    }

  --symbol outline
    use {
      'simrat39/symbols-outline.nvim',
      lock=true,
    }

  -- Useful lua functions used ny lots of plugins
    use {"nvim-lua/plenary.nvim", opt=false}

  --cursor jumpy cool
    --[[ use {
      'edluffy/specs.nvim',
      config = function ()
        require('specs').setup{ 
          show_jumps  = true,
          min_jump = 30,
          popup = {
              delay_ms = 0, -- delay before popup displays
              inc_ms = 10, -- time increments used for fade/resize effects 
              blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
              width = 10,
              winhl = "PMenu",
              fader = require('specs').linear_fader,
              resizer = require('specs').shrink_resizer
          },
          ignore_filetypes = {},
          ignore_buftypes = {
              nofile = true,
          },
        }
      end
    } ]]

  --matchup
    use {
      'andymass/vim-matchup',
      lock=true,
    }

  --same text change fast
    use {
      'osyo-manga/vim-over',
      lock=true,
    }

  --fuzzy file finder 
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  -- file browser
    use { "nvim-telescope/telescope-file-browser.nvim" }
  --auto focus split
    use {
      "beauwilliams/focus.nvim",
      lock=true,
      config = function()
        require("focus").setup({number = true, width=50})
      end
    }

  --pair brackets
    -- use 'p00f/nvim-ts-rainbow'

  --highlighting a range of lines
    use {'winston0410/cmd-parser.nvim', lock=true}
    use {'winston0410/range-highlight.nvim', lock=true}
    

  --color preview
    use {
      'norcalli/nvim-colorizer.lua',
      lock=true
    }
  --shading inactive splits
    use 'sunjon/shade.nvim'

  --file explorer
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = 'kyazdani42/nvim-web-devicons',
    --     lock=true
    -- }

  --updats current root directory(imp for lsp to work)
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
        }
      end
    }

  --colorscheme
    use{
      lock=true,
      'rmehri01/onenord.nvim', -- oneNord
      'folke/tokyonight.nvim', -- tokyoNight
      'Mofiqul/vscode.nvim', -- codeDark(vsCodeTheme)
      -- {'olimorris/onedarkpro.nvim'}, -- onedarkpro
      {
        'navarasu/onedark.nvim',
      },
      {"luisiacc/gruvbox-baby"}, --gruvbox
      {
      "rebelot/kanagawa.nvim",
      config = function ()--{{{
        require('kanagawa').setup({
          undercurl = false,           -- enable undercurls
          commentStyle = "italic",
          functionStyle = "italic",
          keywordStyle = "bold",
          statementStyle = "bold",
          typeStyle = "NONE",
          variablebuiltinStyle = "italic",
          specialReturn = true,       -- special highlight for the return keyword
          specialException = true,    -- special highlight for exception handling keywords 
          transparent = false,        -- do not set background color
          dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
          colors = {},
          overrides = {},
        })
      end
      } -- kangawa}}}
    }

  --treesitter
   use {
     'nvim-treesitter/nvim-treesitter',
     commit = "668de0951a36ef17016074f1120b6aacbe6c4515",
     run = ':TSUpdate'
   }

  --native lsp stuff
    use{
      lock=true,
      'neovim/nvim-lspconfig', --lsp base
      'williamboman/nvim-lsp-installer' --auto lsp installer
    } 

    --Lsp saga
      use { 'tami5/lspsaga.nvim' }  -- nightly

  --snippets
    use {'L3MON4D3/LuaSnip', lock=true} --snippet engine
    use {'rafamadriz/friendly-snippets', lock=true} --snippet library

  --cmp (completion)
    use{
      lock=true,
      'hrsh7th/cmp-nvim-lsp', --cmp source lsp
      'hrsh7th/cmp-nvim-lua', --cmp source nvim lua
      'hrsh7th/cmp-buffer', --cmp source buffer
      'hrsh7th/cmp-path', --cmp source path
      'hrsh7th/cmp-cmdline', --cmp source cmd
      'hrsh7th/nvim-cmp', --base of cmp
      'saadparwaiz1/cmp_luasnip', --for snippets
      'onsails/lspkind-nvim', --customizing cmp
    }

  --indent lines
    use {
      '~/.config/nvim/lua/localPLUG/',
      config = function ()
        require('localPLUG.indentScope').setup({
        draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 0,
            require("localPLUG.indentScope").gen_animation('quarticOut')
            -- Animation rule for scope's first drawing. A function which, given next
            -- and total step numbers, returns wait time (in ms). See
            -- |MiniIndentscope.gen_animation()| for builtin options. To not use
            -- animation, supply `require('mini.indentscope').gen_animation('none')`.
            -- animation = --<function: implements constant 20ms between steps>,
          },

          -- Module mappings. Use `''` (empty string) to disable one.
          mappings = {
            -- Textobjects
            object_scope = 'ii',
            object_scope_with_border = 'ai',

            -- Motions (jump to respective border line; if not present - body line)
            goto_top = '[i',
            goto_bottom = ']i',
          },

          -- Options which control computation of scope. Buffer local values can be
          -- supplied in buffer variable `vim.b.miniindentscope_options`.
          options = {
            -- Type of scope's border: which line(s) with smaller indent to
            -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
            border = 'both',

            -- Whether to use cursor column when computing reference indent. Useful to
            -- see incremental scopes with horizontal cursor movements.
            indent_at_cursor = true,

            -- Whether to first check input line to be a border of adjacent scope.
            -- Use it if you want to place cursor on function header to get scope of
            -- its body.
            try_as_border = false,
          },

          -- Which character to use for drawing scope indicator
          symbol = '|',
                })
      end
    }

  --comments
    -- use 'tpope/vim-commentary'
    use {
      'numToStr/Comment.nvim',
      lock=true
    }
    -- use 'JoosepAlviste/nvim-ts-context-commentstring' --provides context for comments

    use {
      'akinsho/bufferline.nvim', 
      lock=true,
      requires = 'kyazdani42/nvim-web-devicons'
    }

  --status bar
    use {
      'hoob3rt/lualine.nvim',
      lock=true,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

  --auto pair
  
    -- use 'rstacruz/vim-closer'
    use {
      'windwp/nvim-autopairs',
      lock=true,
    }
    -- use 'jiangmiao/auto-pairs'

  --hoppppp
    use {
      'phaazon/hop.nvim',
      lock=true,
      as = 'hop',
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
  --which key never forget your keybinds!!
    --use {
     --"zeertzjq/which-key.nvim",
      --branch="patch-1",
      --config = function()
      --require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      --}
      --end
    --} 

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)
