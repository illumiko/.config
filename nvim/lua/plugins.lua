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
    -- use { 'fgheng/winbar.nvim' }
    use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter"
    }
  --[[advance spell checker]]
    use {
      'lewis6991/spellsitter.nvim',
      config = function()
        require('spellsitter').setup()
      end
    }
  --[[function context]]
    use {
        "https://github.com/haringsrob/nvim_context_vt",
        config=function ()--{{{
            require('nvim_context_vt').setup({
                -- Enable by default. You can disable and use :NvimContextVtToggle to maually enable.
                -- Default: true
                enabled = true,

                -- Override default virtual text prefix
                -- Default: '-->'
                prefix = '',

                -- Override the internal highlight group name
                -- Default: 'ContextVt'
                highlight = 'CustomContextVt',

                -- Disable virtual text for given filetypes
                -- Default: { 'markdown' }
                disable_ft = { 'markdown' },

                -- Disable display of virtual text below blocks for indentation based languages like Python
                -- Default: false
                disable_virtual_lines = false,

                -- Same as above but only for spesific filetypes
                -- Default: {}
                disable_virtual_lines_ft = { 'yaml' },

                -- How many lines required after starting position to show virtual text
                -- Default: 1 (equals two lines total)
                min_rows = 1,

                -- Same as above but only for spesific filetypes
                -- Default: {}
                min_rows_ft = {},
            })
            vim.cmd([[hi CustomContextVt guifg=#444444]])
        end--}}}
    }
  --[[transparent nvim]]
    use {
        'xiyaowong/nvim-transparent',
        config = function ()
          require("transparent").setup({--{{{
            enable = false, -- boolean: enable transparent
            extra_groups = { -- table/string: additional groups that should be cleared
              -- In particular, when you set it to 'all', that means all available groups
              -- example of akinsho/nvim-bufferline.lua
              "BufferLineTabClose",
              "BufferlineBufferSelected",
              "BufferLineFill",
              "BufferLineBackground",
              "BufferLineSeparator",
              "BufferLineIndicatorSelected",
            },
            exclude = {}, -- table: groups you don't want to clear
          })
        end--}}}
    }
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
  --[[multi cursor]]
  use{'mg979/vim-visual-multi',}
  --[[pretty folds]]
  use{
    'anuvyklack/pretty-fold.nvim',
    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    config = function()--{{{
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
          end--}}}
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
      -- commit = '81326c6f8f2dac905f247d79593a2bf17e656b80',
      -- lock=true,
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
          alpha.setup(dashboard.opts)
      end
    }--}}}

  --[[focus]]
    use { "beauwilliams/focus.nvim", config = function() require("focus").setup({width=95}) end }

  --[[session]]
    use "tpope/vim-obsession"

  --[[shade]]
    --[[ use {
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
    } ]]

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
      {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
      },
      { 'JoseConseco/telescope_sessions_picker.nvim', }, -- session picker
    }
  --[[file browser]]
  use { "nvim-neo-tree/neo-tree.nvim",--{{{
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("neo-tree").setup({
          window = {
            position = "right",
            width = 30,
          } ,
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          filesystem = {
            filtered_items = {
              visible = false, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = false,
              hide_gitignored = false,
              hide_hidden = false, -- only works on Windows for hidden files/directories
              hide_by_name = {
                --"node_modules"
              },
              hide_by_pattern = { -- uses glob style patterns
                --"*.meta"
              },
              never_show = { -- remains hidden even if visible is toggled to true
                --".DS_Store",
                --"thumbs.db"
              },
            }
          },
          follow_current_file = true, -- This will find and focus the file in the active buffer every
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
          buffers = {
            follow_current_file = true, -- This will find and focus the file in the active buffer every
                                         -- time the current file is changed while the tree is open.
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
          }
        })
    end
  }--}}}
    -- use { "nvim-telescope/telescope-file-browser.nvim" }

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
      { "catppuccin/nvim",--{{{
          config = function ()
             local catppuccin = require("catppuccin")
            catppuccin.setup({
                transparent_background = true,
                term_colors = false,
                styles = {
                    comments = "italic",
                    conditionals = "italic",
                    loops = "NONE",
                    functions = "italic",
                    keywords = "bold",
                    strings = "NONE",
                    variables = "italic",
                    numbers = "NONE",
                    booleans = "NONE",
                    properties = "italic",
                    types = "NONE",
                    operators = "italic",
                },
                integrations = {
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = "italic",
                            hints = "italic",
                            warnings = "italic",
                            information = "italic",
                        },
                        underlines = {
                            errors = "underline",
                            hints = "underline",
                            warnings = "underline",
                            information = "underline",
                        },
                    },
                    lsp_trouble = false,
                    cmp = true,
                    lsp_saga = true,
                    gitgutter = false,
                    gitsigns = true,
                    telescope = true,
                    nvimtree = {
                        enabled = true,
                        show_root = false,
                        transparent_panel = false,
                    },
                    neotree = {
                        enabled = true,
                        show_root = false,
                        transparent_panel = false,
                    },
                    which_key = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },
                    dashboard = true,
                    neogit = false,
                    vim_sneak = false,
                    fern = false,
                    barbar = false,
                    bufferline = true,
                    markdown = true,
                    lightspeed = false,
                    ts_rainbow = true,
                    hop = true,
                    notify = true,
                    telekasten = false,
                    symbols_outline = true,
                }
            })

          end },--}}}
      "clpi/cyu.lua",
      'folke/tokyonight.nvim', -- tokyoNight
      'tiagovla/tokyodark.nvim',
      {"EdenEast/nightfox.nvim", --{{{
        config = function ()
            require('nightfox').setup({
              options = {
                dim_inactive = false,
                styles = {
                  comments = "italic",
                  keywords = "bold",
                  types = "italic,bold",
                }
              }
            })
        end } ,--}}}
      "kvrohit/rasmus.nvim",
      -- {'olimorris/onedarkpro.nvim'}, -- onedarkpro
      { 'navarasu/onedark.nvim'},
      { 'marko-cerovac/material.nvim',--{{{
          config = function ()
              require('material').setup({
                    contrast = {
                        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                        floating_windows = false, -- Enable contrast for floating windows
                        line_numbers = true, -- Enable contrast background for line numbers
                        sign_column = false, -- Enable contrast background for the sign column
                        cursor_line = true, -- Enable darker background for the cursor line
                        non_current_windows = true, -- Enable darker background for non-current windows
                        popup_menu = false, -- Enable lighter background for the popup menu
                    },

                    italics = {
                        comments = true, -- Enable italic comments
                        keywords = true, -- Enable italic keywords
                        functions = false, -- Enable italic functions
                        strings = false, -- Enable italic strings
                        variables = false -- Enable italic variables
                    },

                    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
                        "terminal", -- Darker terminal background
                        "packer", -- Darker packer background
                        "qf" -- Darker qf list background
                    },

                    high_visibility = {
                        lighter = false, -- Enable higher contrast text for lighter style
                        darker = true -- Enable higher contrast text for darker style
                    },

                    disable = {
                        borders = true, -- Disable borders between verticaly split windows
                        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                        term_colors = false, -- Prevent the theme from setting terminal colors
                        eob_lines = false -- Hide the end-of-buffer lines
                    },

                    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

                    async_loading = true -- Load parts of the theme asyncronously for faster startup (turned on by default)
                })
          end }, --}}}
      { "rebelot/kanagawa.nvim",--{{{
        config = function ()
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
        end } -- kangawa}}}
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
  --[[formatter]]
    use {'mhartington/formatter.nvim',}
  --[[goto def float]]
    use {
      'rmagatti/goto-preview',
      config = function()
        require('goto-preview').setup {
          width = 120; -- Width of the floating window
          height = 15; -- Height of the floating window
          border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
          default_mappings = false; -- Bind default mappings
          debug = false; -- Print debug information
          opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
          resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
          post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
          -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
          focus_on_open = true; -- Focus the floating window when opening it.
          dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
          force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
          bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        }
      end
    }
  --[[null-ls]]
    use{
      "jose-elias-alvarez/null-ls.nvim",
    }

  --[[Lsp saga]]
    use { 'tami5/lspsaga.nvim' }  -- nightly

  --[[snippets]]
    use {
        'L3MON4D3/LuaSnip',
        lock = true
    } --snippet engine
    use {'rafamadriz/friendly-snippets', lock = true} --snippet library

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
      lock = true
    }
  --[[indent line]]
    --[[ use {
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
    } ]]
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
          vim.opt.list = true
          require("indent_blankline").setup {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
          }
        end

    }

  --[[comments]]
    use {
      'numToStr/Comment.nvim',
      lock=true
    }
  --[[buffer management]]
    --[[ use {
      'akinsho/bufferline.nvim',
      lock=true,
      requires = 'kyazdani42/nvim-web-devicons'
    } ]]
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function ()--{{{
        -- Set barbar's options
        vim.g.bufferline = {
          -- Enable/disable animations
          animation = true,
          -- Enable/disable auto-hiding the tab bar when there is a single buffer
          auto_hide = true,
          -- Enable/disable current/total tabpages indicator (top right corner)
          tabpages = true,
          -- Enable/disable close button
          closable = false,
          -- Enables/disable clickable tabs
          --  - left-click: go to buffer
          --  - middle-click: delete buffer
          clickable = false,
          -- Excludes buffers from the tabline
          icons = true,
          -- If set, the icon color will follow its corresponding buffer
          -- highlight group. By default, the Buffer*Icon group is linked to the
          -- Buffer* group (see Highlighting below). Otherwise, it will take its
          -- default value as defined by devicons.
          icon_custom_colors = false,
          -- Configure icons on the bufferline.
          icon_separator_active = '▎',
          icon_separator_inactive = '▎',
          icon_close_tab = '',
          icon_close_tab_modified = '●',
          icon_pinned = '車',
          -- If true, new buffers will be inserted at the start/end of the list.
          -- Default is to insert after current buffer.
          insert_at_end = false,
          insert_at_start = false,

          -- Sets the maximum padding width with which to surround each tab
          maximum_padding = 0,
          -- Sets the maximum buffer name length.
          maximum_length = 30,
          -- If set, the letters for each buffer in buffer-pick mode will be
          -- assigned based on their name. Otherwise or in case all letters are
          -- already assigned, the behavior is to assign letters in order of
          -- usability (see order below)
          semantic_letters = true,
          -- New buffer letters are assigned in this order. This order is
          -- optimal for the qwerty keyboard layout but might need adjustement
          -- for other layouts.
          letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
          -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
          -- where X is the buffer number. But only a static string is accepted here.
          no_name_title = nil,
        }
      end--}}}
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
  --[[nvim-ts-rainbow]]
  use "https://github.com/p00f/nvim-ts-rainbow"
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
