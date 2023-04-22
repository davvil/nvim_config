-- luacheck: globals vim

-- Frequent typo
vim.cmd('command! W w')
-- Close current buffer but keep window layout (from vim-bbye)
vim.cmd('command! Bd Bdelete')
-- Highlight word without search
vim.cmd('command! -nargs=1 Match match MatchGroup <q-args>')
-- Bind two windows
vim.cmd('command! Bind set scrollbind | set cursorbind')
-- Copy current path to selection
vim.cmd('command! Path call setreg("*", expand("%:p:h"))')
-- Toggle text width
vim.cmd([[
  function! TextWidthToggle()
	  if &tw > 0
		  setlocal tw=0
	  else
		  setlocal tw=80
	  endif
  endfunction
]])
