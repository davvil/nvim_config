-- We do this file a module in order to be able to define keybindings from
-- other files (e.g. telescope.lua).
local M = {}

function M.map(shortcut, command)
  vim.api.nvim_set_keymap('', shortcut, command, { noremap = true, silent = true })
end

function M.nmap(shortcut, command)
  vim.api.nvim_set_keymap('n', shortcut, command, { noremap = true, silent = true })
end

function M.imap(shortcut, command)
  vim.api.nvim_set_keymap('i', shortcut, command, { noremap = true, silent = true })
end

function M.xmap(shortcut, command)
  vim.api.nvim_set_keymap('x', shortcut, command, { noremap = true, silent = true })
end

function M.vmap(shortcut, command)
  vim.api.nvim_set_keymap('v', shortcut, command, { noremap = true, silent = true })
end

M.map("<Leader>tw", ":call TextWidthToggle()<CR>")
M.map("<Leader>s", ":set hlsearch!<CR>")
M.map("<Leader>b", ":b#<CR>")
M.map("<Leader>*", ':exe "Match ".expand("<cword>")<CR>')
M.imap("<C-a>", "<C-o>^")
M.imap("<C-e>", "<C-o>$")
M.nmap("Q", "<nop>")
M.nmap("<tab>", ":lua require('vilar.util').window_next()<CR>")
M.nmap("<s-tab>", ":lua require('vilar.util').window_next(true)<CR>")
M.xmap("ga", "<Plug>(EasyAlign)")
M.nmap("ga", "<Plug>(EasyAlign)")
M.map("<MiddleMouse>", "<Nop>")
M.nmap("<C-j>", ":m+1<CR>")
M.nmap("<C-k>", ":m-2<CR>")
M.vmap("<C-j>", ":m '>+1<CR>gv")
M.vmap("<C-k>", ":m '<-2<CR>gv")
M.map("<Leader>w", ":TroubleToggle<CR>")
M.nmap("<Leader>n", ":lua vim.diagnostic.goto_next()<CR>")
M.nmap("<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>")
M.nmap("<Leader>d", ":lua vim.diagnostic.open_float()<CR>")
M.nmap("<C-p>", "<C-i>")

return M
