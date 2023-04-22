local ls = require('luasnip')

local M = {}

M.d = ls.dynamic_node
M.f = ls.function_node
M.sn = ls.snippet_node
M.t = ls.text_node
M.extras = require('luasnip.extras')
M.rep = M.extras.rep

function M.i(index, virtual_text)
  if virtual_text == nil then
    virtual_text = ""
  end
  return ls.insert_node(index, "", {
    node_ext_opts = {
      active = {virt_text={{"  "..virtual_text, "LineNr"}}}}}
  )
end

function M.c(index, choices, virtual_text)
  if virtual_text == nil then
    virtual_text = ""
  end
  return ls.choice_node(index, choices, {
    node_ext_opts = {
      active = {virt_text={{"  "..virtual_text, "LineNr"}}}}}
  )
end

return M
