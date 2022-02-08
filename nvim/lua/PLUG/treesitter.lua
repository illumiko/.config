-- for neorg
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
  install_info = {
    files = { "src/parser.c", "src/scanner.cc" },
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    branch = "main"
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main"
  },
}


-- treesitter startup
require'nvim-treesitter.configs'.setup {
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    disable = {'html','css','sass'}
  },
  indent = {
    enable = true,
    disable = {}
  },
  -- context_commentstring = {
  --   enable = true
  -- },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      '#c678dd',
      '#61afef',
      '#56b6c2',
      '#1da912',
      '#eea821',
      '#e05661',
      '#ee9025',
    },
    -- termcolors = {} -- table of colour name strings
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
  ensure_installed = {
    "norg",
    "norg_meta",
    "norg_table",
    'javascript',
    'vue',
    'html',
    'css',
    'scss',
    'python'
  }
}
