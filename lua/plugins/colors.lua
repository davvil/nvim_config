return {
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require'kanagawa'.setup({
        theme="wave",
        colors={
          theme = {
            wave = {
              ui = {
                bg="#000000",
                fg="palegreen",
                kw='#C5AFE8',
                bg_gutter='none',
              }
            },
          },
        },
        overrides = function(colors)
          return {
            Comment = { fg = "#FF7F24" },
            CocFloating = { link = "PMenu" },
            CocMenuSel = { link = "PMenuSel" },
            WinSeparator = { fg = "#303030" },
            CursorLine = { bg = "#161626" },
            ColorColumn = { bg = "#161626" },
            CursorLineNr = { fg = colors.palette.springBlue },
            VirtColumn = { fg = "#333333" },
            IndentBlanklineIndent1 = { fg = "#49443C" },
            IndentBlanklineIndent2 = { fg = "#2B3328" },
            IndentBlanklineIndent3 = { fg = "#43242B" },
            IndentBlanklineIndent4 = { fg = "#252535" },
            ["@keyword.return"] = { italic = false },
            ["@variable.builtin"] = { italic = false },
            ["@comment.code"] = { fg = colors.palette.fujiGray },
            TSRainbowRed = { fg = colors.palette.autumnRed },
            TSRainbowYellow = { fg = colors.palette.carpYellow },
            TSRainbowBlue = { fg = colors.palette.dragonBlue },
            TSRainbowOrange = { fg = colors.palette.surimiOrange },
            TSRainbowGreen = { fg = colors.palette.springGreen },
            TSRainbowViolet = { fg = colors.palette.oniViolet },
            TSRainbowCyan = { fg = colors.palette.waveAqua1 },
          }
        end,
      })
    end
  },

  {"davvil/melange-nvim"},

  { "ntk148v/habamax.nvim", dependencies={ "rktjmp/lush.nvim" } },

  { "mcchrish/zenbones.nvim",
    dependencies={ "rktjmp/lush.nvim" },
    config = function()
      vim.cmd([[autocmd ColorScheme forestbones lua require "vilar.customize_zenbones".customize()]])
      vim.cmd([[autocmd ColorScheme zenwritten lua require "vilar.customize_zenbones".customize_onlySpellBad()]])
    end
  },

  { "aktersnurra/no-clown-fiesta.nvim" },
  { "mcauley-penney/ice-cave.nvim" },
}
