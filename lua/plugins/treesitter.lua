return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ignore_install = { "help" }

    opts.autopairs = { enable = true }
    opts.indent = { enable = true, disable = { "css" } }
  end,
}
