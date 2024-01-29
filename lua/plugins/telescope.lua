return {
  {
    'nvim-telescope/telescope.nvim',
    tag='0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    config = function()
      vim.cmd('command! F Telescope file_browser')
      vim.cmd('command! Grep Telescope live_grep')
      vim.cmd('command! B Telescope buffers')
      vim.cmd('command! S Telescope search_history')
      vim.cmd('command! Help Telescope help_tags')
      vim.cmd('command! Set Telescope vim_options')

      require('telescope').setup{
        defaults = {
          layout_config = { width = 0.9 },
        },
      }
    end
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function() require("telescope").load_extension "file_browser" end
  },
}
