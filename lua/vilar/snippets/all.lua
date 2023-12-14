local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt


ls.add_snippets("all", {
  s('@today', n.f(function() return os.date("%Y-%m-%d") end)),
  s('@todayText', n.f(function() return os.date("%d %b %Y") end)),
})
