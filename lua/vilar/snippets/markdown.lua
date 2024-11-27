local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("markdown", {
  s("@url", fmt("[{link}]({url})", {
    link = n.i(1),
    url = n.i(2),
  })),
})
