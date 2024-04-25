local lush = require "lush"
local base = require "neobones"

-- Create some specs
local specs = lush.parse(function()
	return {
		SpellBad { base.SpellBad, fg = "None" },
        VirtColumn { base.VirtColumn, fg="#333333" },
        ["@comment.code"] = { base.Comment, guifg = "yellow" },
	}
end)
lush.apply(lush.compile(specs))
vim.cmd([[hi @comment.code guifg=#797979]])
