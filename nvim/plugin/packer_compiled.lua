-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/miko/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/miko/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/miko/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/miko/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/miko/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\b\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0'\4\4\0006\5\5\0009\5\6\0059\5\a\5'\a\b\0B\5\2\2&\4\5\4=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\14\0044\5\0\0=\5\15\4=\4\16\3B\1\2\1K\0\1\0\15conditions\20filetype_is_not\20filename_is_not\1\2\0\0\ttest\1\0\2\15modifiable\2\vexists\2\vevents\1\3\0\0\16InsertLeave\16TextChanged\22execution_message\r%H:%M:%S\rstrftime\afn\bvim\24AutoSave: saved at \1\0\5 clean_command_line_interval\3\0\20on_off_commands\2\22write_all_buffers\1\19debounce_delay\3�\1\fenabled\2\nsetup\rautosave\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n�\n\0\0\5\0\t\0\0146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\a\0009\4\b\1B\2\2\1K\0\1\0\topts\nsetup\1\15\0\0_⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕_⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕_⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑_⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐_⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐_⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔_⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕_⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕_⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕_⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕_⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁_⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  everforest = {
    config = { "\27LJ\2\n�\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0�\1 \n            let g:everforest_background = 'hard'\n            let g:everforest_transparent_background = 0\n            let g:everforest_enable_bold = 1\n            let g:everforest_ui_contrast = 'high'\n          \bcmd\bvim\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\2\n�\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0�\1 \n            let g:gruvbox_material_background = 'soft'\n            let g:gruvbox_material_transparent_background = 0\n            let g:gruvbox_material_enable_bold = 1\n            let g:gruvbox_material_ui_contrast = 'high'\n          \bcmd\bvim\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/hop",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    config = {
      compile_path = "/home/miko/.config/nvim/lua/packer_compiled.lua"
    },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\2B\0\2\1K\0\1\0\14overrides\vcolors\1\0\v\16dimInactive\1\16transparent\1\21specialException\2\18specialReturn\2\25variablebuiltinStyle\vitalic\14typeStyle\tNONE\19statementStyle\tbold\17keywordStyle\tbold\18functionStyle\vitalic\17commentStyle\vitalic\14undercurl\1\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  localPLUG = {
    config = { "\27LJ\2\n�\2\0\0\a\0\f\1\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0006\4\0\0'\6\1\0B\4\2\0029\4\4\4'\6\5\0B\4\2\0?\4\0\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\foptions\1\0\3\vborder\tboth\21indent_at_cursor\2\18try_as_border\2\rmappings\1\0\4\16goto_bottom\a]i\17object_scope\aii\rgoto_top\a[i\29object_scope_with_border\aai\tdraw\1\0\1\vsymbol\b⏽\15quarticOut\18gen_animation\1\0\1\ndelay\3\0\nsetup\26localPLUG.indentScope\frequire\3����\4\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/localPLUG",
    url = "/home/miko/.config/nvim/lua/localPLUG/"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  neorg = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-base16.lua",
    url = "https://github.com/bryant-the-coder/nvim-base16.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\nchars\1\0\3\14normal_hl\23BlackOnLightYellow\fhint_hl\tBold\vborder\vsingle\1\27\0\0\6a\6b\6c\6d\6e\6f\6g\6h\6i\6j\6k\6l\6m\6n\6o\6p\6q\6r\6s\6t\6u\6v\6w\6x\6y\6z\nsetup\16nvim-window\frequire6hi BlackOnLightYellow guifg=#000000 guibg=#f2de91\bcmd\bvim\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/nvim-window.git",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["onenord.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0005\3\3\0004\4\0\0=\4\4\3B\0\3\1K\0\1\0\14blacklist\1\0\14\17reading_text\15Reading %s\15main_image\vneovim\24plugin_manager_text\21Managing plugins\22neovim_image_text\29The One True Text Editor\16auto_update\2\20git_commit_text\23Committing changes\23file_explorer_text\16Browsing %s\21line_number_text\22Line %s out of %s\17editing_text\15Editing %s\fbuttons\2\23enable_line_number\1\21debounce_timeout\3\n\19workspace_text\18Working on %s\14client_id\023793271441293967371\nsetup\rpresence\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n@\0\0\4\0\6\0\a6\0\0\0009\0\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3D\0\3\0\14foldlevel\6v\bvim\6*\brep\vstring�\2\1\0\6\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0005\4\4\0003\5\5\0>\5\2\4=\4\a\0035\4\b\0=\4\t\3=\3\n\2B\0\2\0016\0\0\0'\2\v\0B\0\2\0029\0\2\0005\2\f\0B\0\2\1K\0\1\0\1\0\1\bkey\6h\24pretty-fold.preview\rsections\nright\1\6\0\0\t┫ \27number_of_folded_lines\a: \15percentage\15 ┣━━\tleft\1\0\0\0\1\6\0\0\t━ \0\f ━┫\fcontent\b┣\1\0\2\14fill_char\b━\21keep_indentation\1\nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["shade.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\3\vtoggle\14<Leader>s\18brightness_up\v<C-Up>\20brightness_down\r<C-Down>\1\0\2\20overlay_opacity\0032\17opacity_step\3\1\nsetup\nshade\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/shade.nvim",
    url = "https://github.com/sunjon/shade.nvim"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\vinc_ms\3\n\nwidth\3\n\rdelay_ms\3\0\nwinhl\nPMenu\nblend\3\n\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/specs.nvim",
    url = "https://github.com/edluffy/specs.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n�\v\0\0\4\0@\0C6\0\0\0009\0\1\0005\1\3\0005\2\5\0005\3\4\0=\3\6\2=\2\a\0014\2\0\0=\2\b\0014\2\0\0=\2\t\0015\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0=\3\24\0025\3\25\0=\3\26\0025\3\27\0=\3\28\0025\3\29\0=\3\30\0025\3\31\0=\3 \0025\3!\0=\3\"\0025\3#\0=\3$\0025\3%\0=\3&\0025\3'\0=\3(\0025\3)\0=\3*\0025\3+\0=\3,\0025\3-\0=\3.\0025\3/\0=\0030\0025\0031\0=\0032\0025\0033\0=\0034\0025\0035\0=\0036\0025\0037\0=\0038\0025\0039\0=\3:\0025\3;\0=\3<\0025\3=\0=\3>\2=\2?\1=\1\2\0K\0\1\0\fsymbols\18TypeParameter\1\0\2\ticon\t𝙏\ahl\16TSParameter\rOperator\1\0\2\ticon\6+\ahl\15TSOperator\nEvent\1\0\2\ticon\t🗲\ahl\vTSType\vStruct\1\0\2\ticon\t𝓢\ahl\vTSType\15EnumMember\1\0\2\ticon\b\ahl\fTSField\tNull\1\0\2\ticon\tNULL\ahl\vTSType\bKey\1\0\2\ticon\t🔐\ahl\vTSType\vObject\1\0\2\ticon\b⦿\ahl\vTSType\nArray\1\0\2\ticon\b\ahl\15TSConstant\fBoolean\1\0\2\ticon\b⊨\ahl\14TSBoolean\vNumber\1\0\2\ticon\6#\ahl\rTSNumber\vString\1\0\2\ticon\t𝓐\ahl\rTSString\rConstant\1\0\2\ticon\b\ahl\15TSConstant\rVariable\1\0\2\ticon\b\ahl\15TSConstant\rFunction\1\0\2\ticon\b\ahl\15TSFunction\14Interface\1\0\2\ticon\bﰮ\ahl\vTSType\tEnum\1\0\2\ticon\bℰ\ahl\vTSType\16Constructor\1\0\2\ticon\b\ahl\18TSConstructor\nField\1\0\2\ticon\b\ahl\fTSField\rProperty\1\0\2\ticon\b\ahl\rTSMethod\vMethod\1\0\2\ticon\aƒ\ahl\rTSMethod\nClass\1\0\2\ticon\t𝓒\ahl\vTSType\fPackage\1\0\2\ticon\b\ahl\16TSNamespace\14Namespace\1\0\2\ticon\b\ahl\16TSNamespace\vModule\1\0\2\ticon\b\ahl\16TSNamespace\tFile\1\0\0\1\0\2\ticon\b\ahl\nTSURI\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\6\18goto_location\t<Cr>\18rename_symbol\6r\17code_actions\6a\19toggle_preview\6K\17hover_symbol\14<C-space>\19focus_location\6o\1\3\0\0\n<Esc>\6q\1\0\v\25preview_bg_highlight\nPmenu\24show_symbol_details\2\26show_relative_numbers\1\17show_numbers\1\15auto_close\1\nwidth\0037\19relative_width\2\rposition\nright\17auto_preview\2\16show_guides\2\27highlight_hovered_item\2\20symbols_outline\6g\bvim\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-over"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/vim-over",
    url = "https://github.com/osyo-manga/vim-over"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/miko/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["wal.vim"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\fdisable\1\0\4\16term_colors\1\fborders\2\15background\1\14eob_lines\1\20high_visibility\1\0\2\flighter\1\vdarker\2\23contrast_filetypes\1\4\0\0\rterminal\vpacker\aqf\fitalics\1\0\5\14functions\1\14variables\1\fstrings\1\rcomments\2\rkeywords\2\rcontrast\1\0\2\18async_loading\2\18lualine_style\fstealth\1\0\a\16cursor_line\2\16sign_column\1\17line_numbers\2\21floating_windows\1\rsidebars\1\15popup_menu\1\24non_current_windows\2\nsetup\rmaterial\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/wal.vim",
    url = "https://github.com/dylanaraps/wal.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/miko/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\n\0\0\5\0\t\0\0146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\a\0009\4\b\1B\2\2\1K\0\1\0\topts\nsetup\1\15\0\0_⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕_⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕_⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑_⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐_⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐_⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔_⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕_⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕_⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕_⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕_⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁_⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿\bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: wal.vim
time([[Config for wal.vim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\fdisable\1\0\4\16term_colors\1\fborders\2\15background\1\14eob_lines\1\20high_visibility\1\0\2\flighter\1\vdarker\2\23contrast_filetypes\1\4\0\0\rterminal\vpacker\aqf\fitalics\1\0\5\14functions\1\14variables\1\fstrings\1\rcomments\2\rkeywords\2\rcontrast\1\0\2\18async_loading\2\18lualine_style\fstealth\1\0\a\16cursor_line\2\16sign_column\1\17line_numbers\2\21floating_windows\1\rsidebars\1\15popup_menu\1\24non_current_windows\2\nsetup\rmaterial\frequire\0", "config", "wal.vim")
time([[Config for wal.vim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
time([[Config for impatient.nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\b\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0'\4\4\0006\5\5\0009\5\6\0059\5\a\5'\a\b\0B\5\2\2&\4\5\4=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\14\0044\5\0\0=\5\15\4=\4\16\3B\1\2\1K\0\1\0\15conditions\20filetype_is_not\20filename_is_not\1\2\0\0\ttest\1\0\2\15modifiable\2\vexists\2\vevents\1\3\0\0\16InsertLeave\16TextChanged\22execution_message\r%H:%M:%S\rstrftime\afn\bvim\24AutoSave: saved at \1\0\5 clean_command_line_interval\3\0\20on_off_commands\2\22write_all_buffers\1\19debounce_delay\3�\1\fenabled\2\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
time([[Config for AutoSave.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: shade.nvim
time([[Config for shade.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\3\vtoggle\14<Leader>s\18brightness_up\v<C-Up>\20brightness_down\r<C-Down>\1\0\2\20overlay_opacity\0032\17opacity_step\3\1\nsetup\nshade\frequire\0", "config", "shade.nvim")
time([[Config for shade.nvim]], false)
-- Config for: localPLUG
time([[Config for localPLUG]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\f\1\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0006\4\0\0'\6\1\0B\4\2\0029\4\4\4'\6\5\0B\4\2\0?\4\0\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\foptions\1\0\3\vborder\tboth\21indent_at_cursor\2\18try_as_border\2\rmappings\1\0\4\16goto_bottom\a]i\17object_scope\aii\rgoto_top\a[i\29object_scope_with_border\aai\tdraw\1\0\1\vsymbol\b⏽\15quarticOut\18gen_animation\1\0\1\ndelay\3\0\nsetup\26localPLUG.indentScope\frequire\3����\4\0", "config", "localPLUG")
time([[Config for localPLUG]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\2B\0\2\1K\0\1\0\14overrides\vcolors\1\0\v\16dimInactive\1\16transparent\1\21specialException\2\18specialReturn\2\25variablebuiltinStyle\vitalic\14typeStyle\tNONE\19statementStyle\tbold\17keywordStyle\tbold\18functionStyle\vitalic\17commentStyle\vitalic\14undercurl\1\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: everforest
time([[Config for everforest]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0�\1 \n            let g:everforest_background = 'hard'\n            let g:everforest_transparent_background = 0\n            let g:everforest_enable_bold = 1\n            let g:everforest_ui_contrast = 'high'\n          \bcmd\bvim\0", "config", "everforest")
time([[Config for everforest]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\4\0\6\0\a6\0\0\0009\0\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3D\0\3\0\14foldlevel\6v\bvim\6*\brep\vstring�\2\1\0\6\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0005\4\4\0003\5\5\0>\5\2\4=\4\a\0035\4\b\0=\4\t\3=\3\n\2B\0\2\0016\0\0\0'\2\v\0B\0\2\0029\0\2\0005\2\f\0B\0\2\1K\0\1\0\1\0\1\bkey\6h\24pretty-fold.preview\rsections\nright\1\6\0\0\t┫ \27number_of_folded_lines\a: \15percentage\15 ┣━━\tleft\1\0\0\0\1\6\0\0\t━ \0\f ━┫\fcontent\b┣\1\0\2\14fill_char\b━\21keep_indentation\1\nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: nvim-window.git
time([[Config for nvim-window.git]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\nchars\1\0\3\14normal_hl\23BlackOnLightYellow\fhint_hl\tBold\vborder\vsingle\1\27\0\0\6a\6b\6c\6d\6e\6f\6g\6h\6i\6j\6k\6l\6m\6n\6o\6p\6q\6r\6s\6t\6u\6v\6w\6x\6y\6z\nsetup\16nvim-window\frequire6hi BlackOnLightYellow guifg=#000000 guibg=#f2de91\bcmd\bvim\0", "config", "nvim-window.git")
time([[Config for nvim-window.git]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\vinc_ms\3\n\nwidth\3\n\rdelay_ms\3\0\nwinhl\nPMenu\nblend\3\n\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: gruvbox-material
time([[Config for gruvbox-material]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0�\1 \n            let g:gruvbox_material_background = 'soft'\n            let g:gruvbox_material_transparent_background = 0\n            let g:gruvbox_material_enable_bold = 1\n            let g:gruvbox_material_ui_contrast = 'high'\n          \bcmd\bvim\0", "config", "gruvbox-material")
time([[Config for gruvbox-material]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0005\3\3\0004\4\0\0=\4\4\3B\0\3\1K\0\1\0\14blacklist\1\0\14\17reading_text\15Reading %s\15main_image\vneovim\24plugin_manager_text\21Managing plugins\22neovim_image_text\29The One True Text Editor\16auto_update\2\20git_commit_text\23Committing changes\23file_explorer_text\16Browsing %s\21line_number_text\22Line %s out of %s\17editing_text\15Editing %s\fbuttons\2\23enable_line_number\1\21debounce_timeout\3\n\19workspace_text\18Working on %s\14client_id\023793271441293967371\nsetup\rpresence\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n�\v\0\0\4\0@\0C6\0\0\0009\0\1\0005\1\3\0005\2\5\0005\3\4\0=\3\6\2=\2\a\0014\2\0\0=\2\b\0014\2\0\0=\2\t\0015\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0=\3\24\0025\3\25\0=\3\26\0025\3\27\0=\3\28\0025\3\29\0=\3\30\0025\3\31\0=\3 \0025\3!\0=\3\"\0025\3#\0=\3$\0025\3%\0=\3&\0025\3'\0=\3(\0025\3)\0=\3*\0025\3+\0=\3,\0025\3-\0=\3.\0025\3/\0=\0030\0025\0031\0=\0032\0025\0033\0=\0034\0025\0035\0=\0036\0025\0037\0=\0038\0025\0039\0=\3:\0025\3;\0=\3<\0025\3=\0=\3>\2=\2?\1=\1\2\0K\0\1\0\fsymbols\18TypeParameter\1\0\2\ticon\t𝙏\ahl\16TSParameter\rOperator\1\0\2\ticon\6+\ahl\15TSOperator\nEvent\1\0\2\ticon\t🗲\ahl\vTSType\vStruct\1\0\2\ticon\t𝓢\ahl\vTSType\15EnumMember\1\0\2\ticon\b\ahl\fTSField\tNull\1\0\2\ticon\tNULL\ahl\vTSType\bKey\1\0\2\ticon\t🔐\ahl\vTSType\vObject\1\0\2\ticon\b⦿\ahl\vTSType\nArray\1\0\2\ticon\b\ahl\15TSConstant\fBoolean\1\0\2\ticon\b⊨\ahl\14TSBoolean\vNumber\1\0\2\ticon\6#\ahl\rTSNumber\vString\1\0\2\ticon\t𝓐\ahl\rTSString\rConstant\1\0\2\ticon\b\ahl\15TSConstant\rVariable\1\0\2\ticon\b\ahl\15TSConstant\rFunction\1\0\2\ticon\b\ahl\15TSFunction\14Interface\1\0\2\ticon\bﰮ\ahl\vTSType\tEnum\1\0\2\ticon\bℰ\ahl\vTSType\16Constructor\1\0\2\ticon\b\ahl\18TSConstructor\nField\1\0\2\ticon\b\ahl\fTSField\rProperty\1\0\2\ticon\b\ahl\rTSMethod\vMethod\1\0\2\ticon\aƒ\ahl\rTSMethod\nClass\1\0\2\ticon\t𝓒\ahl\vTSType\fPackage\1\0\2\ticon\b\ahl\16TSNamespace\14Namespace\1\0\2\ticon\b\ahl\16TSNamespace\vModule\1\0\2\ticon\b\ahl\16TSNamespace\tFile\1\0\0\1\0\2\ticon\b\ahl\nTSURI\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\6\18goto_location\t<Cr>\18rename_symbol\6r\17code_actions\6a\19toggle_preview\6K\17hover_symbol\14<C-space>\19focus_location\6o\1\3\0\0\n<Esc>\6q\1\0\v\25preview_bg_highlight\nPmenu\24show_symbol_details\2\26show_relative_numbers\1\17show_numbers\1\15auto_close\1\nwidth\0037\19relative_width\2\rposition\nright\17auto_preview\2\16show_guides\2\27highlight_hovered_item\2\20symbols_outline\6g\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType norg ++once lua require("packer.load")({'vim-table-mode'}, { ft = "norg" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
