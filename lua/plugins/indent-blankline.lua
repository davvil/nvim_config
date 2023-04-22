return {
  {'lukas-reineke/indent-blankline.nvim', -- Indentation guides
  config=function()
    require("indent_blankline").setup {
      space_char_blankline = " ",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
      },
      show_current_context = true,
    }

    vim.g.indent_blankline_filetype_exclude = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "",
      "telekasten",
      "text",
    }
  end
}
}
