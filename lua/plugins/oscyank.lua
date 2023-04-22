return {
  {
    'davvil/vim-oscyank',            -- Copy over ssh
    branch='main',
    config = function()
      vim.cmd([[
        autocmd TextYankPost * if v:event.operator is 'y' && (v:event.regname is '' || v:event.regname is '*') | execute 'OSCYankReg *' | endif
      ]])
    end
  }
}
