local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt

local function required_flags(flag_type)
  local explicit_flags = { double=true, int=true, bool=true }
  local required = n.t"--required "
  if explicit_flags[flag_type[1][1]] then
    required = n.t"--explicit "
  end
  return n.sn(nil, n.c(1, {n.t'', required}, "Flag required?"))
end

ls.add_snippets("sh", {
  s('@gbash', n.t({
    'source gbash.sh || exit',
    'gbash::init_google "$@"',
  })),

-- flags
  s('@flag',
  fmt('DEFINE_{flag_type} {flag_name} {required}"{default}" "{help}"',
    {
      flag_type = n.c(1, {n.t'string', n.t'int', n.t'bool', n.t'double'}, "Flag type"),
      flag_name = n.i(2, "Flag name"),
      default = n.i(3, "Default value"),
      help = n.i(4, "Help message"),
      required = n.d(5, required_flags, {1}),
    })
  ),

  s('scMultiLineVar', n.t'# shellcheck disable=SC2140')

})
