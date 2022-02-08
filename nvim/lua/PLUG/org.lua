require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.completion"] = {
        config = {
            engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
        }
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true, neorg_leader = "<Leader>o"
      }
    },
    ["core.norg.journal"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
        jornal_folder = "/journal/",
        use_folders = true
      }
    },
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
            my_workspace = "~/Documents/neorg/",
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
        last_workspace = vim.fn.stdpath("cache") .. "/neorg_last_workspace.txt" -- The location to write and read the workspace cache file 
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "default",
        default_lists = {
          inbox = "inbox.norg",
        },
        syntax = {
          context = "#contexts",
          start = "#time.start",
          due = "#time.due",
          waiting = "#waiting.for",
        },
        displayers = {
          projects = {
          show_completed_projects = true,
          show_projects_without_tasks = true,
          },
        },
        exlucde = {
          'example.norg'
        },
        custom_tag_completion = true
      }
    },
  },
}

--for completion
