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
      }
  end)
  lush.apply(lush.compile(specs))
end

return _M
