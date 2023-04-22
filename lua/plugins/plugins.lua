-- luacheck: globals vim

return {
  -- Python
  'Vimjas/vim-python-pep8-indent',

  { 'folke/trouble.nvim',
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
	    require("trouble").setup {
		    signs= {
			    error = "✘",
			    warning = "",
			    info = "",
			    hiint = "",
		    },
	    }
    end
   },

   -- Icon font.
   { 'kyazdani42/nvim-web-devicons',
     config = function()
       require'nvim-web-devicons'.setup {
         color_icons = true;
         default = true;
       }
     end
  },

  {'SmiteshP/nvim-navic',             -- LSP context for statusline
    config=function()
      require("nvim-navic").setup({ separator = "  "})
    end
  },

   'stevearc/dressing.nvim',           -- Nicer "dialogs"

   'junegunn/vim-easy-align',         -- align with ga
   'tpope/vim-surround',              -- Change parenthesis, etc. (command + s + motion)
   'dhruvasagar/vim-table-mode',      -- start with \tm
   'tpope/vim-repeat',                -- Better repeat with .
   'moll/vim-bbye',                   -- Delete buffers keeping window layout
   'machakann/vim-highlightedyank',   -- Show the yank region
   'vim-scripts/ReplaceWithRegister', -- Activate with gr{motion) (optionally with register)
   'xiyaowong/virtcolumn.nvim',       -- Nicer colorcolumn
   { 'https://gitlab.com/yorickpeterse/nvim-window.git',  -- Better jump between windows
     config = function()
       require('nvim-window').setup({
         chars = {'1', '2', '3', '4', '5', '6', '7', '8', '9'}
       })
     end },
   { 'kaplanz/nvim-retrail',          -- Deal with end-of-line whitespace
     config = function() require("retrail").setup() end },
   {'axieax/typo.nvim',               -- Handle frequent file typos in the command line
     config = function() require("typo").setup() end },

   { 'davvil/vim-commentary',         -- Changed comments to add ~
     branch='tilde-comment' },

   'junegunn/limelight.vim',          -- Highlight "current" region

   { 'folke/which-key.nvim',          -- Show keybindings
         config = function() require('which-key').setup({}) end },

   'godlygeek/tabular',
   {
     'preservim/vim-markdown',
     config = function()
       vim.g.vim_markdown_new_list_item_indent = 2
     end
   },

   {
     'nvim-tree/nvim-tree.lua',
     config = function()
       require("nvim-tree").setup()
     end
   },

   'mbbill/undotree',
   --~ 'jacquesbh/vim-showmarks',
}
