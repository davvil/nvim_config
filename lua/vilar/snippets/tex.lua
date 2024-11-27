local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("tex", {
  s("@i", n.t"\\item " ),
})

-- Smart quotes
ls.add_snippets("tex", {
  -- Order is important!
  s({ trig='(%S+)"', trigEngine='pattern' },
    n.f(function(_, snip) return snip.captures[1].."''" end)),
  s({ trig='"' }, n.t('``')),
}, {type='autosnippets'})

