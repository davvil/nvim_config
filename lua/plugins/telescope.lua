-- luacheck: globals vim

return {
  {
    'nvim-telescope/telescope.nvim',
    tag='0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    config = function()
      local map = require('vilar.keybindings').map

      vim.cmd('command! F Telescope file_browser')
      vim.cmd('command! Grep Telescope live_grep theme=dropdown')
      vim.cmd('command! B Telescope buffers theme=dropdown')
      vim.cmd('command! S Telescope search_history theme=dropdown')
      vim.cmd('command! Help Telescope help_tags theme=dropdown')
      vim.cmd('command! Set Telescope vim_options theme=dropdown')

      map("<leader>o", ":AerialToggle<CR>")
      map("<leader>O", ":Telescope aerial<CR>")

      require("telescope").setup({ })
    end
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function() require("telescope").load_extension "file_browser" end
  },
}
