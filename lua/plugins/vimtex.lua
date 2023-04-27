return {
  {
    "lervag/vimtex",
    config = function()
      -- Preview methods
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_forward_search_on_start = false
      -- Disable some unused features
      vim.g.vimtex_toc_enabled = 0
      vim.g.vimtex_fold_enabled = 0
      vim.g.vimtex_format_enabled = 0
      vim.g.vimtex_indent_enabled = 0
      --
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
        "Package caption Warning",
      }
    end,
  },
}
