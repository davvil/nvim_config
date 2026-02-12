return {
  cmd = { "lua-language-server" }, -- Optional: override command
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
