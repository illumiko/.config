----------------------------------------------
--[[PLUGINS]]
----------------------------------------------
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
  --[[transparent nvim]]
    use 'xiyaowong/nvim-transparent'
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
  --[[pretty folds]]
  use{
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup{
         keep_indentation = false,
         fill_char = '━',
         sections = {
            left = {
               '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
            },
            right = {
               '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
            }
         }
      }
      require('pretty-fold.preview').setup {
         key = 'h', -- choose 'h' or 'l' key
      }
          end
        }
        --[[whcich Key]]
          use {
            "folke/which-key.nvim",
            config = function()
              require("which-key").setup({})
      end
    }

  --[[window picker]]
    use {
      'https://gitlab.com/yorickpeterse/nvim-window.git',
       config = function ()--{{{
         vim.cmd[[hi BlackOnLightYellow guifg=#000000 guibg=#f2de91]]
         require('nvim-window').setup({
           -- The characters available for hinting windows.
           chars = {
             'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
             'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
           },
           -- A group to use for overwriting the Normal highlight group in the floating
           -- window. This can be used to change the background color.
           normal_hl = 'BlackOnLightYellow',
           -- The highlight group to apply to the line that contains the hint characters.
           -- This is used to make them stand out more.
           hint_hl = 'Bold',
           -- The border style to use for the floating window.
           border = 'single'
         })
       end--}}}
    }
  -- [[norg]]
    use {
      "nvim-neorg/neorg",
      commit = '81326c6f8f2dac905f247d79593a2bf17e656b80',
      lock=true,
      -- commit='b0b2d07d0ffb25eebc102487a5d0f2b70fa7427e',
      requires = "nvim-lua/plenary.nvim",
    }
  --[[Table Creator]]
    use {
      'dhruvasagar/vim-table-mode',
      ft = "norg",
      -- cmd = "tbc"
    }
  --[[autosave]]
    use {
      "Pocco81/AutoSave.nvim",
      config = function ()
        --config{{{
        local autosave = require("autosave")
        autosave.setup(
            {
                enabled = true,
                execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
                events = {"InsertLeave", "TextChanged"},
                conditions = {
                    exists = true,
                    filename_is_not = {'test'},
                    filetype_is_not = {},
                    modifiable = true
                },
                write_all_buffers = false,
                on_off_commands = true,
                clean_command_line_interval = 0,
                debounce_delay = 135
            }
        )
      end--}}}
    }
  --[[discord rich presence]]
    use{
      'andweeb/presence.nvim',
      lock=true,
      config = function ()--{{{
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
      end--}}}
    }
  -- [[Lsp Progress]]
    use {
      'j-hui/fidget.nvim',
      config = function ()
        require"fidget".setup{}
      end
    }
    --use 'windwp/nvim-ts-autotag' --autocompletes html tags

  -- [[nvim greeter]]
    use {--{{{
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
    }--}}}

  --[[focus]]
    use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }

  --[[session]]
    use "tpope/vim-obsession"

  --[[shade]]
    use {
      'sunjon/shade.nvim',
       config = function ()
         require'shade'.setup({
         overlay_opacity = 50,
         opacity_step = 1,
         keys = {
           brightness_up    = '<C-Up>',
           brightness_down  = '<C-Down>',
           toggle           = '<Leader>s',
         }
       })
      end
    }

  --[[git related plugins]]
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
    }

  --[nvim terminal]]
    use {
      'akinsho/toggleterm.nvim',
      lock=true,
    }

  --[lua functions for nvim]]
    use {
      "nvim-lua/popup.nvim",
      lock=true,
    }

  --[symbol outline]]
    use {
      'simrat39/symbols-outline.nvim',
      lock=true,--{{{
      config = function ()
        vim.g.symbols_outline = {
          highlight_hovered_item = true,
          show_guides = true,
          auto_preview = true,
          position = 'right',
          relative_width = true,
          width = 55,
          auto_close = false,
          show_numbers = false,
          show_relative_numbers = false,
          show_symbol_details = true,
          preview_bg_highlight = 'Pmenu',
          keymaps = { -- These keymaps can be a string or a table for multiple keys
            close = {"<Esc>", "q"},
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a",
          },
            lsp_blacklist = {},
            symbol_blacklist = {},
            symbols = {
            File = {icon = "", hl = "TSURI"},
            Module = {icon = "", hl = "TSNamespace"},
            Namespace = {icon = "", hl = "TSNamespace"},
            Package = {icon = "", hl = "TSNamespace"},
            Class = {icon = "𝓒", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "", hl = "TSMethod"},
            Field = {icon = "", hl = "TSField"},
            Constructor = {icon = "", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "ﰮ", hl = "TSType"},
            Function = {icon = "", hl = "TSFunction"},
            Variable = {icon = "", hl = "TSConstant"},
            Constant = {icon = "", hl = "TSConstant"},
            String = {icon = "𝓐", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "🔐", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "", hl = "TSField"},
            Struct = {icon = "𝓢", hl = "TSType"},
            Event = {icon = "🗲", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "𝙏", hl = "TSParameter"}
          }
      }
      end--}}}
    }

  --[[Useful lua functions used ny lots of plugins]]
    use {"nvim-lua/plenary.nvim", opt=false}

  --[[cursor jumpy cool]]
    use {
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
    }

  --[[matchup]]
    use {
      'andymass/vim-matchup',
      lock=true,
    }

  --[[same text change fast]]
    use {
      'osyo-manga/vim-over',
      lock=true,
    }

  --[[Telescope]]
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  --[[file browser]]
    use { "nvim-telescope/telescope-file-browser.nvim" }

  --[[color preview]]
    use {
      'norcalli/nvim-colorizer.lua',
      config = function ()
        require'colorizer'.setup()
      end,
      lock=true
    }

  --[[updats current root directory(imp for lsp to work)]]
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
        }
      end
    }

  --[[colorscheme]]
    use{
      lock=true,
      'rmehri01/onenord.nvim', -- oneNord
      'folke/tokyonight.nvim', -- tokyoNight
      'tiagovla/tokyodark.nvim',
      'Mofiqul/vscode.nvim', -- codeDark(vsCodeTheme)
      -- {'olimorris/onedarkpro.nvim'}, -- onedarkpro
      { 'navarasu/onedark.nvim'},
      {"https://github.com/dylanaraps/wal.vim"},
      {
        "https://github.com/sainnhe/everforest",
        config = function ()
          vim.cmd([[ 
            set background=dark
            let g:everforest_background = 'hard'
            let g:everforest_transparent_background = 0
            let g:everforest_enable_bold = 1
            let g:everforest_ui_contrast = 'high'
          ]])
        end

      },
      {
        "sainnhe/gruvbox-material",
        config = function ()--{{{
          vim.cmd([[ 
            let g:gruvbox_material_background = 'soft'
            let g:gruvbox_material_transparent_background = 0
            let g:gruvbox_material_enable_bold = 1
            let g:gruvbox_material_ui_contrast = 'high'
          ]])
        end--}}}
      }, --gruvbox
      { "rebelot/kanagawa.nvim",
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
      --}}}
      } -- kangawa
    }

  --[[treesitter]]
     use {
       'nvim-treesitter/nvim-treesitter',
       commit = "668de0951a36ef17016074f1120b6aacbe6c4515",
       run = ':TSUpdate'
     }

  --[[native lsp stuff]]
    use{
      lock=true,
      'neovim/nvim-lspconfig', --lsp base
      'williamboman/nvim-lsp-installer' --auto lsp installer
    } 
  --[[null-ls]]
    use{
      "jose-elias-alvarez/null-ls.nvim",
    }

  --[[Lsp saga]]
    use { 'tami5/lspsaga.nvim' }  -- nightly

  --[[snippets]]
    use {'L3MON4D3/LuaSnip'} --snippet engine
    use {'rafamadriz/friendly-snippets'} --snippet library

  --[[cmp (completion)]]
    use{
      'hrsh7th/cmp-nvim-lsp', --cmp source lsp
      'hrsh7th/cmp-nvim-lua', --cmp source nvim lua
      'hrsh7th/cmp-buffer', --cmp source buffer
      'hrsh7th/cmp-path', --cmp source path
      'hrsh7th/cmp-cmdline', --cmp source cmd
      'hrsh7th/nvim-cmp', --base of cmp
      'saadparwaiz1/cmp_luasnip', --for snippets
      'onsails/lspkind-nvim', --customizing cmp
    }
  --[[indent line]]
    use {
      '~/.config/nvim/lua/localPLUG/',
      config = function ()--{{{
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
            try_as_border = true,
          },
          -- Which character to use for drawing scope indicator
          symbol = '⏽',
                })
      end--}}}
    }
  --[[comments]]
    use {
      'numToStr/Comment.nvim',
      lock=true
    }
  --[[buffer management]]
    use {
      'akinsho/bufferline.nvim',
      lock=true,
      requires = 'kyazdani42/nvim-web-devicons'
    }
  --[[status bar]]
    use {
      'hoob3rt/lualine.nvim',
      lock=true,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- use 'rstacruz/vim-closer'
  --[[nvim-autopairs]]
    use {
      'windwp/nvim-autopairs',
      lock=true
    }
  --[[hoppppp]]
    use {
      'phaazon/hop.nvim',
      lock=true,
      as = 'hop',
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
end)
