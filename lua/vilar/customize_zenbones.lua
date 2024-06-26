local _M = {}

local lush = require "lush"
local base = require "forestbones"

-- Create some specs
function _M.customize()
  local specs = lush.parse(function(injected_functions)
      local sym = injected_functions.sym
      return {
          SpellBad { base.SpellBad, fg = "None" },
          --~ VirtColumn { base.VirtColumn, fg="#333333" },
          VirtColumn { base.VirtColumn, fg="#444444" },
          Comment { base.Comment, fg="#c3d9e7" },
          sym("@comment.code") { base.Comment, fg="#536977" },
          --~ markdownH1 { base.Title, bg="#0862bd"},
          --~ markdownH1Delimiter { base.Title, bg="#0862bd"},
          --~ markdownH2 { base.Title, bg="#03468a"},
          --~ markdownH2Delimiter { base.Title, bg="#03468a"},
          --~ markdownH3 { base.Title, bg="#002a54"},
          --~ markdownH3Delimiter { base.Title, bg="#002a54"},

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

return _M
