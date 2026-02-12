--------------------------------------------------------------------------------
-- This functions are used for specifying the version control information
-- Adapt for your specific use case
local vcinfo = function() return "" end
local vcpath = {
              'filename',
              file_status=false,
              path = 3
            }
--------------------------------------------------------------------------------

local function pos_info()
  local line = vim.fn.line('.')
  local n_lines = vim.fn.line('$')
  local perc = math.floor(line / n_lines * 100)
  local col = vim.fn.virtcol('.')
  return string.format('  %3d:%-2d 󱪶  %d (%d%%%%)', line, col, n_lines, perc)
end

local function searchcount()
  if vim.v.hlsearch == 0 then
    return ''
  end

  local result = vim.fn.searchcount { maxcount = 999, timeout = 500 }
  local denominator = math.min(result.total, result.maxcount)
  return string.format('  %d/%d', result.current, denominator)
end

local function windownr()
  return ' ' .. vim.fn.winnr()
end

local colors = {
  fgA = '#252525',
  bgA = '#999999',
  fgB = '#BBBBBB',
  bgB = '#464646',
  fgC = '#ABABAB',
  bgC = '#202020',
  fgZ = '#252525',
  bgZ = 'orange',
}

local function dvt_theme()
  return {
    normal = {
      a = { fg = colors.fgA, bg = colors.bgA, gui = 'bold' },
      b = { fg = colors.fgB, bg = colors.bgB },
      c = { fg = colors.fgC, bg = colors.bgC },
      z = { fg = colors.fgZ, bg = colors.bgZ },
    },
  }
end


local filename_sec = {
  {
    'filetype',
    colored = false,
    icon_only = true,
  },
  {
    'filename',
    symbols = {
      modified = ' ',
      readonly = ' ',
    },
  },
}

local diagnostics_sec = {
  {
    'diagnostics',
    colored = false,
    symbols = { error = '✘', warning = ' ', hint = ' ' }
  }
}

return {
  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons'},
    config = function()
      require('lualine').setup{
        options={
          --~ theme = dvt_theme(),
          component_separators = { left = '', right = ''},
        },

        sections = {
          lualine_a = {'mode'},
          lualine_b = filename_sec,
          lualine_c = {vcinfo},
          lualine_x = {searchcount, windownr},
          lualine_y = {pos_info},
          lualine_z = {},
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = filename_sec,
          lualine_x = {windownr},
          lualine_y = {},
          lualine_z = {},
        },

        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = { vcpath },
          lualine_z = diagnostics_sec,
        }
      }
    end
  }
}
