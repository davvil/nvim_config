return {
  {'ggandor/lightspeed.nvim',         -- Better movement (overwrites s key!)
  config = function()
    vim.cmd([[
      noremap f f
      noremap F F
      noremap t t
      noremap T T
      noremap ; ;
      noremap , ,
    ]])
  end
  }
}
