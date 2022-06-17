local util = require("formatter.util")
require("formatter").setup({
	filetype = {
		lua = {
			require("format.filetype_conf.lua").stylua,
		},
		javascript = {
			require("format.filetype_conf.javascript").prettiereslint,
			function()
				return {
					exe = "prettier-eslint",
					args = {
                        "--tabWidth 4",
						"--stdin",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		typescript = {
			require("format.filetype_conf.typescript").prettiereslint,
		},
	},
})
