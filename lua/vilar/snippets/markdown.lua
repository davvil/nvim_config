local ls = require('luasnip')
local s = ls.s
local n = require('vilar.snippets.nodes')
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("markdown", {
  s("@xid", fmt("[xid/{xid}](http://xid/{xid_url})", {
    xid = n.i(1),
    xid_url = n.f(function(xid) return xid[1][1] end, {1}),
  })),

  s("@cl", fmt("[cl/{cl}](http://cl/{cl_url})", {
    cl = n.i(1),
    cl_url = n.f(function(cl) return cl[1][1] end, {1}),
  })),


  s("@url", fmt("[{link}]({url})", {
    link = n.i(1),
    url = n.i(2),
  })),
})
