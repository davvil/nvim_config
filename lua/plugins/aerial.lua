return {
  {
  'stevearc/aerial.nvim',                -- Code overview
  config=function()
    require('aerial').setup({
      layout = {
        default_direction='right',
        placement='edge',
      },
      attach_mode='global',
      open_automatic=true,
    })
    require('telescope').load_extension('aerial')
    local map = require('vilar.keybindings').map
    map("<Leader>o", ":Telescope aerial<CR>")
    map("<Leader>O", ":AerialToggle<CR>")
  end
  }
}
