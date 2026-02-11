return {
  cmd = { "lua-language-server" }, -- Optional: override command
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
