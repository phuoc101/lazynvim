return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      local status_ok, lsp_lines = pcall(require, "lsp_lines")
      if not status_ok then
        return
      end

      lsp_lines.setup()

      vim.diagnostic.config({ virtual_lines = false })
      vim.wo.signcolumn = "yes"

    end,
  },
}
