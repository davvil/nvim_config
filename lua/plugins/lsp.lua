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
      require'lspconfig'.lua_ls.setup {
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
      }
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
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

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
              nvim_lsp = '󰅯 ',
              buffer = '󰺯 ',
              nvim_ciderlsp = '󱜚 ',
              nvim_lsp_signature_help = '󰊕 ',
              path = '󰙅 ',
              spell = '󰓆 ',
              nvim_lua = ' ',
              luasnip = ' ',
            }),
            symbol_map = {
              Text = '󰙩 ',
              Variable = '󱃼 ',
            },
          }),
        },

        sources = cmp.config.sources({
          { name = 'luasnip' },
          { name = 'nvim_ciderlsp' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'buffer',
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
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lua',
  'f3fora/cmp-spell',
}
