vim.lsp.enable("lua_ls")

vim.lsp.inline_completion.enable()

-- Tab: Select next item if menu is open, otherwise Insert Tab
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, replace_keycodes = true })

-- Shift-Tab: Select inline completion if available, if not previous item if
-- menu is visible, if not pass it through.
vim.keymap.set("i", "<S-Tab>", function()
  if not vim.lsp.inline_completion.get() then
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
  end
end, { expr = true, replace_keycodes = true })
