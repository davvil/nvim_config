local M = {}

local function add_marks_from(marks, line_nr, file_name)
  local marks_for_line = ""
  for _, m in ipairs(marks) do
    if m.pos[2] == line_nr and m.file==file_name then
      local mark_name = m.mark:sub(2)
      if mark_name:match("[a-zA-Z]") then
        marks_for_line = marks_for_line .. mark_name
      end
    end
  end
  return marks_for_line
end

function M.get_marks_in_line(line_nr, rel_line_nr)
  if line_nr == nil then
    line_nr, _ = unpack(vim.api.nvim_win_get_cursor(0))
  end

  local marks_for_line
  -- Local to buffer
  marks_for_line = add_marks_from(vim.fn.getmarklist(vim.api.nvim_buf_get_name(0)), line_nr, nil)
  -- Global ones
  file_name = vim.api.nvim_buf_get_name(0)
  marks_for_line = marks_for_line..add_marks_from(vim.fn.getmarklist(), line_nr, file_name)

  if marks_for_line ~= "" then
    marks_for_line = " " .. marks_for_line
  else
    if rel_line_nr == 0 then
      marks_for_line = line_nr
    else
      marks_for_line = rel_line_nr
    end
  end
  return marks_for_line
end

vim.cmd([[
  function! MarkInLine(line_nr, rel_line_nr)
    return luaeval("require('vilar.marks_stc').get_marks_in_line(".a:line_nr.",".a:rel_line_nr.")")
  endfunction
]])

return M
