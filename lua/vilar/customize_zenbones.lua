local _M = {}

local lush = require "lush"
local base = require "forestbones"

-- Create some specs
function _M.customize()
  local specs = lush.parse(function(injected_functions)
      local sym = injected_functions.sym
      return {
          SpellBad { base.SpellBad, fg = "None" },
          VirtColumn { base.VirtColumn, fg="#444444" },
          Comment { base.Comment, fg="#c3d9e7" },
          sym("@comment.code") { base.Comment, fg="#536977" },
          CommentedCode { base.Comment, fg="#536977" },

          -- Following the color scheme in MeanderingProgrammer/markdown.nvim
          markdownH1 { base.DiffAdd },
          markdownH2 { base.DiffChange },
          markdownH3 { base.DiffDelete },
          markdownH1Delimiter { base.DiffAdd },
          markdownH2Delimiter { base.DiffChange },
          markdownH3Delimiter { base.DiffDelete },
      }
  end)
  lush.apply(lush.compile(specs))
end

function _M.customize_onlySpellBad()
  local specs = lush.parse(function(injected_functions)
      local sym = injected_functions.sym
      return {
          SpellBad { base.SpellBad, fg = "None" },
      }
  end)
  lush.apply(lush.compile(specs))
end

return _M
