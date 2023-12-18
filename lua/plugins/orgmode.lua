local map = require('vilar.keybindings').map

return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = { -- Adds pretty icons to your documents
            config = {
              icons = {
                todo = {
                  undone = {
                    icon = " ",
                  }
                }
              }
            }
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/drive/My Drive/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {},
        },
      }
      vim.cmd("autocmd FileType norg setlocal cole=2")

      map("<Leader>tl", ":lua require('telescope.builtin').grep_string({search='( )'})<CR>")
    end,
  },
}
