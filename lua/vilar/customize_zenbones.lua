local _M = {}

local lush = require "lush"
local base = require "neobones"

-- Create some specs
function _M.customize()
  local specs = lush.parse(function(injected_functions)
      local sym = injected_functions.sym
      return {
          SpellBad { base.SpellBad, fg = "None" },
          VirtColumn { base.VirtColumn, fg="#333333" },
          Comment { base.Comment, fg="#c3d9e7" },
          sym("@comment.code") { base.Comment, fg="#536977" },
          markdownH1 { base.Title, bg="#0862bd"},
          markdownH1Delimiter { base.Title, bg="#0862bd"},
          markdownH2 { base.Title, bg="#03468a"},
          markdownH2Delimiter { base.Title, bg="#03468a"},
          markdownH3 { base.Title, bg="#002a54"},
          markdownH3Delimiter { base.Title, bg="#002a54"},
      }
  end)
  lush.apply(lush.compile(specs))
end

return _M
