local M = {}

function M.window_next(reverse)
  -- This is a legacy funciton from when I used aerial. Probably it could be
  -- simplified or removed now.
  local command = "w"
  if reverse then
    command = "W"
  end
  if vim.v.count > 0 then
    vim.cmd(vim.v.count.."wincmd "..command)
  else
    vim.cmd("wincmd "..command)
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

-- Function for telekasten to set a link with a custom display text
-- Most of the body taken over from InsertLink in the main telekasten
-- implementation
function M.tkInsertLinkWithTitle(opts)
    local tk = require('telekasten')
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    opts = opts or {}
    opts.insert_after_inserting = opts.insert_after_inserting
        or tk.Cfg.insert_after_inserting
    opts.close_after_yanking = opts.close_after_yanking
        or tk.Cfg.close_after_yanking
    opts.subdirs_in_links = opts.subdirs_in_links or tk.Cfg.subdirs_in_links

    local cwd = tk.Cfg.home
    local find_command = tk.Cfg.find_command
    local sort = tk.Cfg.sort
    local attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection == nil then
                selection = { filename = action_state.get_current_line() }
            end
            local basename = selection.filename:match("(.+)%..+")
            local display_text = vim.fn.input("Display text? ")
            vim.api.nvim_put(
                { "[[" .. basename .. "|" .. display_text .. "]]" },
                "",
                false,
                true
            )
            vim.api.nvim_feedkeys("a", "m", false)
        end)
        return true
    end

    if opts.with_live_grep then
        require('telescope.builtin').live_grep({
            prompt_title = "Insert link to note with live grep",
            cwd = cwd,
            attach_mappings = attach_mappings,
            find_command = find_command,
            sort = sort,
            disable_coordinates = true,
            default_text = "title:.*",
        })
    else
        tk.find_files_sorted({
            prompt_title = "Insert link to note",
            cwd = cwd,
            attach_mappings = attach_mappings,
            find_command = find_command,
            sort = sort,
        })
    end
end

return M
