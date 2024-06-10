return {
  -- LSP itself
  -- Note that for some langauges (python, C++) the config is in the local part
  -- of the config.
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Rust
      require('lspconfig').rust_analyzer.setup({})

      -- Lua
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- LaTeX
      --~ require('lspconfig').texlab.setup({})
    end
  },
  'onsails/lspkind.nvim',
  {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function() require('toggle_lsp_diagnostics').init() end
  },

  -- Completions
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      local CR_mapping = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        c = function(fallback) fallback() end,
      })

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        preselect = cmp.PreselectMode.None,

        mapping = cmp.mapping.preset.insert({
          --~ ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ["<CR>"] = CR_mapping,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            elseif cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              fallback()
            end
          end),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if luasnip.choice_active() then
              luasnip.change_choice(-1)
            elseif cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
              fallback()
            end
          end),
        }),

        formatting = {
          format = lspkind.cmp_format({
            mode="symbol",
            menu = ({
              nvim_lsp = '(LSP)',
              buffer = '(Buffer)',
              nvim_ciderlsp = '(CiderLSP)',
              nvim_lsp_signature_help = '(Signature)',
              path = '(Path)',
              spell = '(Spell)',
              nvim_lua = '(Lua)',
              luasnip = '(Luasnip)',
            }),
            symbol_map = {
              Text = '󰙩 ',
              Variable = '󱃼 ',
            },
          }),
        },

        sources = cmp.config.sources({
          { name = 'nvim_ciderlsp', priority=30 },
          { name = 'nvim_lsp', priority=20 },
          { name = 'luasnip', priority=10 },
          { name = 'omni', priority=1 },
          { name = 'nvim_lua', priority=1 },
          { name = 'nvim_lsp_signature_help', priority=10 },
          { name = 'buffer', priority=1,
          keyword_length=5,
          -- Complete from all buffers
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          },
        },
        { name = 'path' },
      }),
    })

    cmp.setup.filetype({'telekasten', 'text'}, {
      sources =({
        { name = 'buffer', keyword_length=5 },
        { name = 'spell', keyword_length=5 },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline({["<CR>"] = CR_mapping}),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({["<CR>"] = CR_mapping}),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
  },

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-omni',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lua',
  'f3fora/cmp-spell',

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        ui = {
          border = "rounded",
        },
        lightbulb = {
          enable=false,
        },
        symbol_in_winbar = {
          enable = true,
          show_file = false,
        },
      })
    end,
  },

  {  -- Show diagnostics only in the corner
    'dgagn/diagflow.nvim',
    -- event = 'LspAttach', This is what I use personnally and it works great
    config = function()
      require('diagflow').setup({
        show_borders = true,
        show_sign = false,  -- See https://github.com/dgagn/diagflow.nvim/issues/43
        scope = 'line',
        toggle_event = { 'InsertEnter', 'InsertLeave' },
        border_chars = {
          top_left = "╭",
          top_right = "╮",
          bottom_left = "╰",
          bottom_right = "╯",
        }
      })
    end,
  },
}
