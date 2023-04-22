-- luacheck: globals vim

local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt

local function add_arg_snippet(tsnode, args_table, jump)
  local var_name = vim.treesitter.query.get_node_text(tsnode, 0)
  if var_name ~= 'self' then
    table.insert(args_table, n.t'  ')
    table.insert(args_table, n.t(var_name))
    table.insert(args_table, n.t': ')
    table.insert(args_table, n.i(jump[1]))
    table.insert(args_table, n.t{'', ''})  -- Newline
    jump[1] = jump[1] + 1
  end
end

local function gen_docstring()
  local row, column = unpack(vim.api.nvim_win_get_cursor(0))
  local node = vim.treesitter.get_node_at_pos(0, row, column)
  while node and node:type() ~= "function_definition" do
    node = node:parent()
  end
  local parameters = nil
  for child in node:iter_children() do
    if child:type() == "parameters" then
      parameters = child
      break
    end
  end

  local args_desc = {}
  if parameters ~= nil then
    local jump = {1}  -- Table in order to pass by reference
    for p in parameters:iter_children() do
      if p:type() == "identifier" then
        add_arg_snippet(p, args_desc, jump)
      else
        for child in p:iter_children() do
          if child:type() == "identifier" then
            add_arg_snippet(child, args_desc, jump)
          end
        end
      end
    end
  end

  return n.sn(nil, args_desc)
end

-- Docstring generation
ls.add_snippets("python", {
    s('@"""', fmt([[
"""
{}

Args:
{}

Returns: {}
"""]],
{n.i(1, "Description"),
 n.d(2, gen_docstring),
 n.i(3, "Return value")})),

-- flags
  s('@flag', fmt("{var_name} = flags.DEFINE_{flag_type}('{flag_name}', {default}, '{help}'{required})",
    {
      flag_type = n.c(1, {n.t'string', n.t'integer', n.t'bool', n.t'float', n.t'enum'}, "Flag type"),
      flag_name = n.i(2, "Flag name"),
      default = n.i(3, "Flag default value"),
      help = n.i(4, "Flag help"),
      required = n.c(5, {n.t'', n.t', required=True'}, "Flag required?"),
      var_name = n.f(function(name) return '_' .. string.upper(name[1][1]) end, {2}),
    })
  ),

})
