return {

  {
    -- Breadcrumbs for the upper bar
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true,
        },
      })
    end,
  },

  {
    'saghen/blink.cmp',
    version = "1.*",
    opts = {
      keymap = { preset = 'super-tab' },
      completion = { documentation = { auto_show = true } },
      snippets = { preset = 'luasnip' },
      sources = { default = { 'lsp', 'snippets', 'path', 'buffer' } },
    },
  },


  'onsails/lspkind.nvim',  -- Pictograms for completions

  {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },

  {  -- Show diagnostics only in the corner
    'dgagn/diagflow.nvim',
    -- event = 'LspAttach', This is what I use personnally and it works great
    config = function()
      require('diagflow').setup({
        show_borders = true,
        show_sign = false,  -- See https://github.com/dgagn/diagflow.nvim/issues/43
        scope = 'line',
        toggle_event = { 'InsertEnter', 'InsertLeave' },
        border_chars = {
          top_left = "╭",
          top_right = "╮",
          bottom_left = "╰",
          bottom_right = "╯",
        }
      })
    end,
  },

}
