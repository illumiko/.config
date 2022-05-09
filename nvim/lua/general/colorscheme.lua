-- tokyodark {{{
-- vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1"
--}}}
--[[ --tokyonight{{{
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_transparent = true
vim.cmd([=[colorscheme tokyonight]=])
--}}} ]]
-- --onedark--{{{
-- require('onedark').setup  {
--     -- Main options --
--     style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = false,  -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     -- toggle theme style ---
--     toggle_style_key = '<leader>ts', -- Default keybinding to toggle
--     toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
--
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
--
--     -- Custom Highlights --
--     colors = {}, -- Override default colors
--     highlights = {}, -- Override highlight groups
--
--     -- Plugins Config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
-- vim.cmd('colorscheme onedark')
-- --}}}
-- --material{{{
-- vim.g.material_style = 'deep ocean'
-- vim.cmd([[
--     colorscheme material
-- ]])--}}}
-- vim.cmd("colorscheme rasmus")
vim.cmd([=[
colorscheme tokyodark
hi BufferTabpageFill guibg=none
]=])

