return {
  {
  'stevearc/aerial.nvim',                -- Code overview
  config=function()
    require('aerial').setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end,
      layout = {
        default_direction='right',
        placement='edge',
      },
      attach_mode='global',
      open_automatic=true,
    })
    require('telescope').load_extension('aerial')
    local map = require('vilar.keybindings').map
    map("<leader>o", ":AerialToggle<CR>")
    map("<leader>O", ":Telescope aerial<CR>")
  end
  }
}
