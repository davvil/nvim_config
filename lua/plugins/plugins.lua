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
  { 'kaplanz/nvim-retrail',          -- Deal with end-of-line whitespace
    config = function() require("retrail").setup() end },
  {'axieax/typo.nvim',               -- Handle frequent file typos in the command line
    config = function() require("typo").setup() end },

  { 'davvil/vim-commentary',         -- Changed comments to add ~
    branch='tilde-comment' },

  'junegunn/limelight.vim',          -- Highlight "current" region

  { 'stevearc/stickybuf.nvim',       -- Do not open files in "sticky windows", e.g. aerial
    config = function() require("stickybuf").setup() end },

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
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local function nvim_tree_on_attach(bufnr)
        local api = require('nvim-tree.api')

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '<tab>', function() require('vilar.util').window_next() end, {buffer = bufnr, noremap = true, silent = true, nowait = true })
      end

      require("nvim-tree").setup({on_attach=nvim_tree_on_attach})
    end
  },

  'mbbill/undotree',
  'coderifous/textobj-word-column.vim',  -- Column objects
}
