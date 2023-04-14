return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    -- config = function()
    --   local c = require("vscode.colors").get_colors()
    --   require("vscode").setup({
    --     -- Enable italic comment
    --     italic_comments = true,
    --     -- Disable nvim-tree background color
    --     disable_nvimtree_bg = true,
    --   })
    --   require("vscode").load()
    -- end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
    config = function()
      local colors = require("ayu.colors")
      colors.generate(false)
      require("ayu").setup({
        overrides = {
          Visual = { bg = colors.fg_idle, fg = colors.black },
          IncSearch = { bg = colors.tag, fg = colors.selection_bg, bold = true },
          Comment = { fg = colors.comment, italic = true },
        },
      })
    end,
  },
  {
    "git@github.com:phuoc101/LazyVim.git",
    opts = {
      colorscheme = "ayu",
    },
  },
}
