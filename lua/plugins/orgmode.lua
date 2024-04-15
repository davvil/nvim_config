local map = require('vilar.keybindings').map

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,
    config = function()
      require("neorg").setup({
        load = {
          --~ ["core.defaults"] = {}, -- Loads default behaviour
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
          --~ ["core.dirman"] = { -- Manages Neorg workspaces
          --~   config = {
          --~     workspaces = {
          --~       notes = "~/notes",
          --~     },
          --~     default_workspace = "notes",
          --~   },
          --~ },
        --~   ["core.summary"] = {},
        },
      })
      vim.cmd([[
        autocmd FileType norg setlocal cole=2
        autocmd FileType norg setlocal concealcursor=ncv
        autocmd FileType norg setlocal nowrap
        map <leader>pi <cmd>Telescope papis<cr>
        map <Leader>pk :PapisShowPopup<CR>
        map <Leader>pv :PapisOpenFile<CR>
      ]])

      --~ map("<Leader>tl", ":lua require('telescope.builtin').grep_string({search='( )'})<CR>")
      --~ map("<Leader>nm", ":lua require('nabla').enable_virt(); vim.cmd('setlocal concealcursor=ncv')<CR>")
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
