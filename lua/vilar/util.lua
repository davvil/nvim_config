local M = {}

local aerial_util = require('aerial.util')

function M.window_next(reverse)
  local command = "w"
  if reverse then
    command = "W"
  end
  if vim.v.count > 0 then
    vim.cmd(vim.v.count.."wincmd "..command)
  else
    vim.cmd("wincmd "..command)
    if aerial_util.is_aerial_buffer() then
      vim.cmd("wincmd "..command)
    end
  end
end

local function zettelkasten_previous_week_todos(bufname)
  local week_nr = tonumber(string.match(bufname, "weekly/%d+-W(%d+).md"))
  -- Todo: check if previous week does not exist
  local prev_fname = string.gsub(bufname, "(weekly/%d+-W)"..week_nr, "%1"..(week_nr-1))
  local todos = {}
  local todos_found = false
  local skip_todo = false
  for l in io.lines(prev_fname) do
    if not todos_found then
      todos_found = (string.find(l, "# TODOs") ~= nil)
    else
      if string.find(l, "%- %[ %]") ~= nil then
        skip_todo = false
      elseif string.find(l, "%- %[x%]") then
        skip_todo = true
      end
      if not skip_todo then
        table.insert(todos, l)
      end
    end
  end
  return todos
end

function M.telekasten_weekly_todos()
  -- Carry over TODOs from previous weekly entry.
  vim.fn.cursor(0, 0)
  local title_line = vim.fn.search('title: Weekly [0-9]\\{4}-W[0-9]\\{2}', 'n')
  if title_line ~= 0 then
    local todos_line = vim.fn.search('{{TODOs}}', 'n')
    if todos_line ~= 0 then
      -- Find previous week
      vim.api.nvim_buf_set_lines(0, todos_line-1, todos_line, false,
        zettelkasten_previous_week_todos(vim.api.nvim_buf_get_name(0)))
    end
  end
end

return M
