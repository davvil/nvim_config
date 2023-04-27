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

return M
