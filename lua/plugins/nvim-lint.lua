return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        sh = {'shellcheck'},
        lua = {'luacheck'},
      }
      local ok, local_defs = pcall(require, 'local.config')
      if ok and local_defs.lint_config ~= nil then
        local_defs.lint_config(lint)
      end

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
