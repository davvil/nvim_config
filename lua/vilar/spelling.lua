vim.api.nvim_create_augroup("Spelling", {clear=true})

vim.opt.spellsuggest="best,20"
vim.opt.spellfile="vim-spell.utf-8.add"

function addSpelling(ft)
  local group = vim.api.nvim_create_augroup("Spelling", {clear=false})
  vim.api.nvim_create_autocmd("Filetype", {pattern=ft, command="setlocal spell"})
end

addSpelling("python")
addSpelling("text")
addSpelling("telekasten")
addSpelling("markdown")
