return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Enable italic comment
        italic_comments = true,
        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,
      })
      require("vscode").load()
    end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    config = function()
      vim.g.material_style = "darker"
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

  {
    "git@github.com:phuoc101/LazyVim.git",
    opts = {
      colorscheme = "vscode",
    },
  },
}
