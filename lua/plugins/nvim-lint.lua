return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require('lint')

      lint.linters.gpylint = {
        cmd = 'gpylint3',
        stdin = true,
        parser = lint.linters.pylint.parser,
        args = { '-f', 'json', '--from-stdin', function() return vim.fn.expand('%') end },
        ignore_exitcode = true,
      }

      lint.linters_by_ft = {
        python = {'gpylint'},
        sh = {'shellcheck'},
        lua = {'luacheck'},
      }

      vim.cmd([[
      function! SetLint()
        au BufEnter,BufWritePost,TextChanged,InsertLeave <buffer=abuf> lua require('lint').try_lint()
      endfunction
      ]])

      vim.cmd([[
      augroup linting
        au!
        au FileType sh call SetLint()
        au FileType python call SetLint()
        au FileType lua call SetLint()
      ]])
    end
  }
}
