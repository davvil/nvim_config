return {
  {
   'renerocksai/telekasten.nvim',
   dependencies = { "renerocksai/calendar-vim" },
   config=function()
      local home = vim.fn.expand("~/zettelkasten")
      require('telekasten').setup({
          home = home,
          new_note_filename = "uuid",
          uuid_type = "rand",
          template_new_note = home .. '/' .. 'templates/new_note.md',
          template_new_weekly = home .. '/' .. 'templates/weekly.md',
          template_new_daily = home .. '/' .. 'templates/daily.md',
          sort = "modified",
          media_previewer = "localviu-previewer",
          })

      vim.cmd([[
      nnoremap <Leader>zf :lua require('telekasten').find_notes()<CR>
      nnoremap <Leader>zd :lua require('telekasten').find_daily_notes()<CR>
      nnoremap <Leader>zg :lua require('telekasten').search_notes()<CR>
      nnoremap <Leader>zz :lua require('telekasten').follow_link()<CR>
      nnoremap <Leader>zT :lua require('telekasten').goto_today()<CR>
      nnoremap <Leader>zW :lua require('telekasten').goto_thisweek()<CR>
      nnoremap <Leader>zw :lua require('telekasten').find_weekly_notes()<CR>
      nnoremap <Leader>zn :lua require('telekasten').new_note()<CR>
      nnoremap <Leader>zN :lua require('telekasten').new_templated_note()<CR>
      nnoremap <Leader>zy :lua require('telekasten').yank_notelink()<CR>
      nnoremap <Leader>zc :lua require('telekasten').show_calendar()<CR>
      nnoremap <Leader>zC :CalendarT<CR>
      nnoremap <Leader>zi :lua require('telekasten').paste_img_and_link()<CR>
      nnoremap <Leader>zt :lua require('telekasten').toggle_todo({onlyTodo=true})<CR>
      nnoremap <Leader>zb :lua require('telekasten').show_backlinks()<CR>
      nnoremap <Leader>zF :lua require('telekasten').find_friends()<CR>
      nnoremap <Leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
      "~ nnoremap <Leader>zp :lua require('telekasten').preview_img()<CR>
      nnoremap <Leader>zm :lua require('telekasten').browse_media()<CR>
      nnoremap <Leader>za :lua require('telekasten').show_tags()<CR>
      nnoremap <Leader>z# :lua require('telekasten').show_tags()<CR>
      nnoremap <Leader>zr :lua require('telekasten').rename_note()<CR>
      nnoremap <Leader>zp :PapisShowPopup<CR>

      " on hesitation, bring up the panel
      nnoremap <Leader>z :lua require('telekasten').panel()<CR>

      " we could define [[ in **insert mode** to call insert link
      autocmd FileType telekasten inoremap <buffer> [[ <cmd>:lua require('telekasten').insert_link({with_live_grep=true})<CR>
      " alternatively: leader [
      "~ inoremap <Leader>z[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
      "~ inoremap <Leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
      "~ inoremap <Leader>z# <cmd>lua require('telekasten').show_tags({i = true})<cr>
      "~ inoremap <Leader>zp <cmd>Telescope papis<cr>
      "~ inoremap \z[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
      "~ inoremap \zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
      "~ inoremap \z# <cmd>lua require('telekasten').show_tags({i = true})<cr>
      "~ inoremap \zp <cmd>Telescope papis<cr>

      function ToggleConceallevel()
        if &cole == 0
          setlocal cole=2
        else
          setlocal cole=0
        endif
      endfunction
      autocmd FileType telekasten map <buffer> <Leader>c :call ToggleConceallevel()<CR>
      autocmd FileType telekasten setlocal cole=2
      autocmd FileType telekasten setlocal nowrap
      autocmd FileType telekasten lua require('luasnip').config.setup({enable_autosnippets = true })
      autocmd FileType telekasten lua require('dressing').setup({input={enabled=false}})
      autocmd BufReadPost *.md lua require('vilar.util').telekasten_weekly_todos()

      map <Leader>zlt :lua require('telescope.builtin').grep_string({search='[ ] TODO'})<CR>

      ]])
    end
  }
}
