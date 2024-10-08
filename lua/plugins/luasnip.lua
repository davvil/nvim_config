return {
  { 'L3MON4D3/LuaSnip',
    config=function()
      local ls = require('luasnip')

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      require'luasnip'.config.setup({ enable_autosnippets = true })

      vim.keymap.set({'i', 's'}, '<A-Tab>', function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({'i', 's'}, '<S-A-Tab>', function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set('n', '<Leader><leader>s',
        '<cmd>source ~/.config/nvim/lua/vilar/luasnip.lua<CR>')

      require('vilar.snippets.all')
      require('vilar.snippets.python')
      require('vilar.snippets.sh')
      require('vilar.snippets.telekasten')
      require('vilar.snippets.tex')
      require('vilar.snippets.markdown')
      pcall(require, 'local.snippets')
    end
  }
}
