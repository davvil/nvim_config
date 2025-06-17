vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Diagnostic symbols
require('vilar.diagnostics')

-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local local_lua_path = vim.fn.stdpath("config") .. "/lua/local"
if not vim.loop.fs_stat(local_lua_path .. "/plugins.lua") then
  vim.fn.system({"mkdir", "-p", local_lua_path})
  local fp = io.open(local_lua_path .. "/plugins.lua", "w")
  fp:write("return {}")
  fp:close()
end
if not vim.loop.fs_stat(local_lua_path .. "/config.lua") then
  vim.fn.system({"mkdir", "-p", local_lua_path})
  local fp = io.open(local_lua_path .. "/config.lua", "w")
  fp:write([[
local M = {}

return M
]])
  fp:close()
end

require('lazy').setup({
  spec="plugins",
  change_detection = {
    notify = false,
  },
})

-- Options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4           -- For actual tabs
vim.opt.shiftwidth = 2        -- For autoindent
vim.opt.expandtab = true      -- Subsitute tabs with...
vim.opt.softtabstop = 2       -- ...2 spaces
vim.opt.path = "**"           -- Search in subdirectories
vim.opt.virtualedit = "block" -- Allow visual model over "shorter" lines
--~ vim.opt.mouse = "nv"          -- Mouse in normal and visual mode (but not insert!)
vim.opt.mouse = ""            -- Disable mouse
vim.opt.cursorline = true     -- Highlight current line
vim.opt.signcolumn = "yes"    -- Column for linting symbols
vim.opt.completeopt = "noinsert,menuone,noselect" -- Completion menu
vim.opt.clipboard = "unnamed" -- Use the '*' register for yank, etc.
vim.opt.hlsearch = false      -- Do not highlight search by default
vim.opt.inccommand = "split"  -- Live preview for substitutions
vim.opt.shortmess:append("cS") -- No "match x of y" messages for autocompletion and search results
vim.opt.concealcursor = "nv"  -- Only show concealed text when editing
vim.opt.foldenable = false    -- Disable folds
vim.opt.wildmode = "longest:full,full"  -- Complete until longest match, but also show a menu
vim.opt.showcmd = false       -- Do not ehco commands
vim.opt.colorcolumn = "80"

require('vilar.marks_stc')
vim.opt.relativenumber = true  -- Needed for statuscolumn to work properly
vim.opt.statuscolumn = '%s%3{MarkInLine(v:lnum, v:relnum)} '

-- Autochdir does not seem to work, probably because of some plugin
vim.api.nvim_create_autocmd("BufEnter", { pattern="*", command="silent! lcd %:p:h" } )

-- Settings for python seem to be overwritten, probably should move this to ftplugin
vim.api.nvim_create_autocmd("FileType",
  { pattern="python", command="set shiftwidth=2 tabstop=2 expandtab" })

-- Do not continue comments on new lines
vim.api.nvim_create_autocmd("FileType",
  { pattern="*", command="setlocal formatoptions-=ro" })

-- Do not treat list items as comments in markdown
vim.api.nvim_create_autocmd("FileType",
  { pattern="markdown", command="set comments=b:>" })

-- Specific textwidths
vim.api.nvim_create_autocmd("FileType",
  { pattern={"text", "telekasten"},
	command="setlocal tw=80" })
vim.api.nvim_create_autocmd("FileType",
  { pattern={"markdown"},
	command="setlocal tw=0" })

-- Asymptote
vim.api.nvim_create_autocmd({"BufEnter", "BufRead"},
  { pattern="*.asy", command="setf asy" })

-- Colors
vim.opt.termguicolors = true
--~ vim.cmd("colorscheme kanagawa")
--~ vim.cmd("colorscheme habamax.nvim")
vim.cmd("colorscheme forestbones")

-- Spelling
require('vilar.spelling')

-- Keybindings
require('vilar.keybindings')

-- Command and function definitions
require('vilar.commands')

-- Load local config (if it exists)
pcall(require, 'local.config')

-- Disable the inline diagnostics, as this is handled by the plugins
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

