require("which-key").setup({
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	window = {
		border = "single",
		position = "top",
		margin = { 1, 2, 1, 2 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})
