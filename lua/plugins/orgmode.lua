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
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {},
        },
      }
      vim.cmd("autocmd FileType norg setlocal cole=2")
      vim.cmd("autocmd FileType norg setlocal concealcursor=ncv")
      vim.cmd("autocmd FileType norg setlocal nowrap")

      map("<Leader>tl", ":lua require('telescope.builtin').grep_string({search='( )'})<CR>")
      map("<Leader>nm", ":lua require('nabla').enable_virt(); vim.cmd('setlocal concealcursor=ncv')<CR>")
    end,
  },

  {
    'jbyuki/nabla.nvim',
    --~ config = function()
      --~ vim.cmd("autocmd FileType norg lua require('nabla').enable_virt({autogen=true})")
      --~ vim.cmd("autocmd FileType norg setlocal concealcursor=ncv")
    --~ end,
  },
}
