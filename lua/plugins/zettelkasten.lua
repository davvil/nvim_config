return {
  {
   'renerocksai/telekasten.nvim',
   config=function()
      local home = vim.fn.expand("~/zettelkasten")
      require('telekasten').setup({
          home = home,
          new_note_filename = "uuid-title",
          template_new_note = home .. '/' .. 'templates/new_note.md',
          template_new_weekly = home .. '/' .. 'templates/weekly.md',
          uuid_type = "%Y%m%d%H%M",
          uuid_sep = "-",
          sort = "filename",
          media_previewer = "localviu-previewer",
          })

      vim.cmd([[
      nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
      nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
      nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
      nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
      nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
      nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
      nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
      nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
      nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
      nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
      nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
      nnoremap <leader>zC :CalendarT<CR>
      nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
      nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
      nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
      nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
      nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
      "~ nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
      nnoremap <leader>zp :lua require('vilar.zettelpapis').search_papis()<CR>
      nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
      nnoremap <leader>za :lua require('telekasten').show_tags()<CR>
      nnoremap <leader>z# :lua require('telekasten').show_tags()<CR>
      nnoremap <leader>zr :lua require('telekasten').rename_note()<CR>

      " on hesitation, bring up the panel
      nnoremap <leader>z :lua require('telekasten').panel()<CR>

      " we could define [[ in **insert mode** to call insert link
      " inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
      " alternatively: leader [
      inoremap <leader>z[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
      inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
      inoremap <leader>z# <cmd>lua require('telekasten').show_tags({i = true})<cr>

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
      ]])
    end
  }
}
