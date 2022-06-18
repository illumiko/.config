require("neo-tree").setup({
	window = {
		position = "right",
		width = 30,
	},
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
		},
	},
	follow_current_file = true, -- This will find and focus the file in the active buffer every
	hijack_netrw_behavior = "open_current",
	use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
	},
})
