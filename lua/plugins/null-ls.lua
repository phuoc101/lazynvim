return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics
      null_ls.setup({
        debug = false,
        sources = {
          -- Python
          formatting.black.with({ extra_args = { "--line-length=120" } }),
          diagnostics.flake8.with({
            extra_args = { "--max-line-length=120", "--extend-ignore=E203" },
          }),
          -- Lua
          formatting.stylua,
          -- LaTeX
          formatting.latexindent.with({ extra_args = { "--modifyLineBreaks" } }),
          -- Markdown
          formatting.mdformat,
          -- xml
          formatting.xmlformat.with({ extra_args = { "--blanks"} }),
          -- cmake
          formatting.cmake_format,
        },
      })
    end,
  },
}
