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

  {
    'mg979/vim-visual-multi',
    branch='master',
    config = function() vim.cmd("VMTheme purplegray") end,
  },

  'godlygeek/tabular',

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({
        anti_conceal = { enabled = false },
        win_options = {
          concealcursor = {
            rendered = 'nv',
          },
        },
        checkbox = {
          unchecked = {
            icon = '󰄱',
          },
          checked = {
            icon = '󰄵',
          },
        },
        heading = {
          icons = { '▶ ', '● ', '○ ', '◉ ', '✺ ', '⤷ ' },
          backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
          }
        },
        bullet = {
          icons = { '◆', '◇', '◈', '⋄' },
        },
        code = {
          highlight = 'PMenuExtra',
          highlight_inline = 'PMenuExtra',
          position = 'right',
          width = 'block',
          left_pad = 2,
          right_pad = 2,
        },
        sign = { enabled = false, },
      })
    end,
  },

  {
    'tzachar/highlight-undo.nvim',
    config = function()
	  require('highlight-undo').setup({})
    end
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
  {
    'lervag/vimtex',
    config = function()
      vim.cmd([[
      let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]
      let g:vimtex_view_general_viewer = 'zathura'
      "~ let g:vimtex_view_general_viewer = 'sioyek'
      let g:vimtex_view_automatic = 0
      ]])
    end
  },

  { -- Shade inactive windows
    'miversen33/sunglasses.nvim',
    config = function()
        require('sunglasses').setup({
          filter_type = "SHADE",
          filter_percent = .3,
        })
    end,
  },

  --~ { -- Mark words without searching for them
  --~   'inkarkat/vim-mark',
  --~   dependencies='inkarkat/vim-ingo-library',
  --~ },

  {
    "karb94/neoscroll.nvim",
    opts = {
      duration_multiplier = 0.2,
      hide_cursor = true,
    },
  },

  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        -- See Setup section below
      })
    end
  },

}

