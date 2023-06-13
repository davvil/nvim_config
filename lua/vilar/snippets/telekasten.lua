local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt

-- Snippets that work at the end of a word
local sw = function(trig, subst)
  return s(
    {trig='(%a*)'..trig, regTrig=true},
    n.f(function(_, snip) return snip.captures[1]..subst end)
  )
end

ls.add_snippets("telekasten", {
  -- UTF-8 math symbols
  s('\\sum ', n.t('∑')),
  s('\\prod ', n.t('∏')),

  s('\\pi ', n.t('π')),
  s('\\epsilon ', n.t('ε')),

  sw('_i ', 'ᵢ'),
  sw('_k ', 'ₖ'),
  sw('_n ', 'ₙ'),

  sw('^2 ', '²'),
  sw('^3 ', '³'),
  sw('^n ', 'ⁿ'),

  sw('%->', ' '),
  sw('<%-', ' '),
  sw('=>', '󰧂 '),
  sw('<=', '󰧀 '),

  sw(' < ', ' &lt; '),
},
{type='autosnippets'})
