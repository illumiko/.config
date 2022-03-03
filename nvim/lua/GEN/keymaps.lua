local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

--normal mode
  -- [[Norg]]
  map('n', '<leader>oNs', ':NeorgStart<CR>', opts)
  map('n', '<leader>oNjtd', ':Neorg journal today<CR>', opts)
  map('n', '<leader>oNjty', ':Neorg journal yesterday<CR>', opts)
  --verticle movement in wrapped lines
  --[[ map("n", "j", "gj", opts)
  map("n", "k", "gk", opts) ]]
  -- [[telescope]]
  -- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
  map("n", "<leader>fFp", "<cmd>lua require('telescope.builtin').find_files({cwd='~/Documents/Projects/'})<CR>", opts) -- opening telescope in Projects dir
  map("n", "<leader>fFc", "<cmd>lua require('telescope.builtin').find_files({cwd='~/.config/'})<CR>", opts) --  opening telescope in config folder
  map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts) --  opening telescope in config folder
  -- map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
  -- [[lsp]]
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --[[ map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) ]]
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', '<leader>Sd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --[[ map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) ]]

  --save
  --[[ map('n', '<leader>Sw',':w<CR>', opts)
  -- save and exit
  map('n', '<leader>SWq',':wq<CR>', opts)
  -- exit
  map('n', '<leader>Sq',':q!<CR>', opts) ]]

  --debugger
    --[[ map('n', '<F5>' ,":lua require'dap'.continue()<CR>", opts)
    map('n','<F10>', ':lua require"dap".step_over()<CR>', opts)
    map('n','<F11>', ':lua require"dap".step_into()<CR>', opts)
    map('n','<F12>', ':lua require"dap".step_out()<CR>', opts)
    map('n','<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', opts)
    map('n','<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
    map('n','<leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
    map('n','<leader>dr', ':lua require"dap".repl.open()<CR>', opts)
    map('n','<leader>dl', ':lua require"dap".run_last()<CR>', opts) ]]

  -- [[packer stuff]]
  map('n', '<leader>Pi',':PackerInstall<CR>', opts)
  map('n', '<leader>Pc',':PackerCompile<CR>', opts)
  map('n', '<leader>PC',':PackerClean<CR>', opts)
  map('n', '<leader>Ps',':PackerStatus<CR>', opts)
  map('n', '<leader>PS',':PackerSync<CR>', opts)

  -- [[hop]]
  map('n', '<leader>hl',':HopLine<CR>', opts)
  map('n', '<leader>hc',':HopChar1<CR>', opts)
  map('n', '<leader>hw',':HopWord<CR>', opts)

  -- [[nvim tree toggle]]
  map('n', '<Leader>e',':NvimTreeToggle<CR>', opts)

  -- [[no hl]]
  map('n', '<Leader>H',':set hlsearch!<CR>', opts)

  -- [[better split management]]
  --[[ map('n',"<C-h>","<C-w>h", opts)
  map('n',"<C-j>","<C-w>j", opts)
  map('n',"<C-k>","<C-w>k", opts)
  map('n',"<C-l>","<C-w>l", opts) ]]


  --  [[Resizeing Splits with arrow]]
  map('n', "<C-Up>",":resize -2<CR>", opts)
  map('n', "<C-Down>",":resize +2<CR>", opts)
  map('n', "<C-Left>",":vertical resize -2<CR>", opts)
  map('n', "<C-Right>",":vertical resize +2<CR>", opts)

  -- [[moving line of code on cursor up /  down]]
  map('n', "<A-j>",":m .+1<CR>==", opts)
  map('n', "<A-k>",":m .-2<CR>==", opts)

  --buffer move (bar bar)
  --[[ map('n', "<S-h>",":BufferPrevious<CR>", opts)
  map('n', "<S-l>",":BufferNext<CR>", opts)
  map('n', "<Leader>bc",":BufferClose<CR>", opts)
  map('n', "<C-[>",":BufferMovePrevious<CR>", opts)
  map('n', "<C-]>",":BufferMoveNext<CR>", opts) ]]
  -- [[bufferline]]
  map('n', "<S-h>",":BufferLineCyclePrev<CR>", opts)
  map('n', "<S-l>",":BufferLineCycleNext<CR>", opts)
  map('n', "<Leader>bc",":BufferLinePickClose<CR>", opts)
  map('n', "<Leader>bp",":BufferLinePick<CR>", opts)
  map('n', "<Leader>bsd",":BufferLineSortByRelativeDirectory<CR>", opts)
  map('n', "<Leader>bsD",":BufferLineSortByDirectory<CR>", opts)
  map('n', "<Leader>bse",":BufferLineSortByExtension<CR>", opts)

  --vertical split
  map('n', "<Leader>v",":vsp<CR>", opts)

  --split
  map('n', "<Leader>v",":sp<CR>", opts)

--insert mode
  --[[
  map('i', '<A-Up>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
  map('i', '<A-Down>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
  map('i', '<A-Left>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
  map('i', '<A-Right>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})
  ]]

  --better ESC
  map('i', 'jj', '<ESC>', opts)
  map('i', 'jk', '<ESC>', opts)

--visiual mode
  --better indenting
  map('v', "<","<gv", opts)
  map('v', ">",">gv", opts)
  map('v', '<leader>c',':Commentary<CR>', opts)

--visual block
  -- map('x', '<leader>c',':Commentary<CR>', opts)

 --moving blocks of code
 map('x', "K",":move '<-2<CR>gv-gv", opts)
 map('x', "J",":move '>+1<CR>gv-gv", opts)

 -- TAB Complete
 -- map('x', '<expr><TAB>', 'pumvisible() ? \"\\<C-n\" : \"\\<TAB>\"', {noremap = true, silent = true})

--command mode
  -- map('c',"<C-j>",'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {noremap = true, expr=true})
  -- map('c',"<C-k>",'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {noremap = true, expr=true})

