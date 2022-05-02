local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

vim.cmd([[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])
--[===[normal mode]===]
    --[[hjkl movement in colemak]]
        map('n', '<C-h>', 'h', opts)
        map('n', '<C-n>', 'j', opts)
        map('n', '<C-e>', 'k', opts)
        map('n', '<C-i>', 'l', opts)
    -- [[better window movemnt]]
        map("n","<leader>w",":lua require('nvim-window').pick()<CR>",opts)
    -- [[Norg]]
        map('n', '<leader>oNs', ':NeorgStart<CR>', opts)
        map('n', '<leader>oNjtd', ':Neorg journal today<CR>', opts)
        map('n', '<leader>oNjty', ':Neorg journal yesterday<CR>', opts)
    --[[verticle movement in wrapped lines]]
    --[[ map("n", "j", "gj", opts)
        map("n", "k", "gk", opts) ]]
    -- [[telescope]]
        -- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
        map("n", "<leader>fFp", "<cmd>lua require('telescope.builtin').find_files({cwd='~/Documents/Projects/'})<CR>", opts) -- opening telescope in Projects dir
        map("n", "<leader>fFc", "<cmd>lua require('telescope.builtin').find_files({cwd='~/.config/'})<CR>", opts) --  opening telescope in config folder
        map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts) --  opening telescope in config folder
        map("n", "<leader>G", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts) --  opening telescope in config folder
    -- map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
    -- [[lsp]]
        map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        map('n', '<leader>Sd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

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
    -- map('n', '<Leader>e',':NvimTreeToggle<CR>', opts)
        map('n', '<Leader>e',':Telescope file_browser path=%:p:h<CR>', opts)

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

    -- [[bufferline]]
        map("n", "<S-h>", ":TablineBufferPrevious<cr>",opts)
        map("n", "<S-l>", ":TablineBufferNext<cr>",opts)
        --[[ map('n', "<S-h>",":BufferLineCyclePrev<CR>", opts)
        map('n', "<S-l>",":BufferLineCycleNext<CR>", opts)
        map('n', "<Leader>bc",":BufferLinePickClose<CR>", opts) ]]
        map("n", "<S-Tab>", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts) --bufferPicker
--[[
        map('n', "<Leader>bsd",":BufferLineSortByRelativeDirectory<CR>", opts)
        map('n', "<Leader>bsD",":BufferLineSortByDirectory<CR>", opts)
        map('n', "<Leader>bse",":BufferLineSortByExtension<CR>", opts)
]]

    --vertical split
        map('n', "<Leader>v",":vsp<CR>", opts)

    --split
        map('n', "<Leader>v",":sp<CR>", opts)

    --[===[insert mode]===]
        --[[
        map('i', '<A-Up>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
        map('i', '<A-Down>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
        map('i', '<A-Left>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
        map('i', '<A-Right>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})
        ]]

    --better ESC
    map('i', 'jj', '<ESC>', opts)
    map('i', 'jk', '<ESC>', opts)
    map('i', '<C-ne>', '<ESC>', opts)
    --[===[visiual mode]===]
    --better indenting
        map('v', "<","<gv", opts)
        map('v', ">",">gv", opts)
        map('v', '<leader>c',':Commentary<CR>', opts)

    --[===[visual block]===]
    -- map('x', '<leader>c',':Commentary<CR>', opts)

    --moving blocks of code
        map('x', "K",":move '<-2<CR>gv-gv", opts)
        map('x', "J",":move '>+1<CR>gv-gv", opts)
