return {
   {
     'nvim-treesitter/nvim-treesitter',
     build = ':TSUpdate',
     config = function()
      -- Note that the definition of @comment.code is in ~/.vim/after/queries/*/highlights.scm
      vim.api.nvim_set_hl(0, "@comment.code", { link = "CommentCode" })

      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = {
          "python",
          "lua",
          "vim",
          "bash",
          "vimdoc",
          "rust",
          "markdown",
          "markdown_inline",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gts",
            node_incremental = "gti",
            node_decremental = "gtd",
            scope_incremental = "gtc",
          },
        },

        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<Leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<Leader>A"] = "@parameter.inner",
            },
          },
        },
      }
      end
    },

   'nvim-treesitter/nvim-treesitter-textobjects',
   'JoosepAlviste/nvim-ts-context-commentstring',  -- Set the correct commentstring also with embedded languages

   -- Nice plugin, but slows down operation
   -- {
   --   'code-biscuits/nvim-biscuits',       -- Show context of closing parentheses
   --   enabled = true,                      -- See https://github.com/code-biscuits/nvim-biscuits/issues/45
   --   config = function()
   --     require('nvim-biscuits').setup({
   --       max_file_size = '20kb',
   --       default_config = {
   --         cursor_line_only = true,
   --         prefix_string = "󱞸 ",
   --       },
   --       language_config = {
   --         vimdoc = { disabled = true },  -- i.e. help
   --         markdown = { disabled = true },
   --       },
   --     })
   --   end,
   -- },

   {
     'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
     config = function()
       require('rainbow-delimiters.setup').setup({
           highlight = {
             'RainbowDelimiterGreen',
             'RainbowDelimiterYellow',
             'RainbowDelimiterBlue',
             'RainbowDelimiterOrange',
             'RainbowDelimiterViolet',
             'RainbowDelimiterCyan',
             'RainbowDelimiterRed',
           },
         }
       )
     end
   },
 }
