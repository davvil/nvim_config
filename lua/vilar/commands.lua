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

vim.cmd([[
" Taken from https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
function! Redir(cmd, rng, start, end)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let cmd = a:cmd =~' %'
			\ ? matchstr(substitute(a:cmd, ' %', ' ' . shellescape(escape(expand('%:p'), '\')), ''), '^!\zs.*')
			\ : matchstr(a:cmd, '^!\zs.*')
		if a:rng == 0
			let output = systemlist(cmd)
		else
			let joined_lines = join(getline(a:start, a:end), '\n')
			let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
			let output = systemlist(cmd . " <<< $" . cleaned_lines)
		endif
	else
		redir => output
		execute a:cmd
		redir END
		let output = split(output, "\n")
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	call setline(1, output)
endfunction

" This command definition includes -bar, so that it is possible to "chain" Vim commands.
" Side effect: double quotes can't be used in external commands
command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)

" This command definition doesn't include -bar, so that it is possible to use double quotes in external commands.
" Side effect: Vim commands can't be "chained".
command! -nargs=1 -complete=command -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)
]])
