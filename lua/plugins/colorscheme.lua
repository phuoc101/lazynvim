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
    config = function()
      local colors = require("ayu.colors")
      colors.generate(false)
      require("ayu").setup({
        overrides = {
          Visual = { bg = colors.fg_idle, fg = colors.accent },
          IncSearch = { bg = colors.tag, fg = colors.selection_bg, bold = true },
          Comment = { fg = colors.comment, italic = true },
        },
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      -- local colors = require("nightfox.lib.color")
      -- local carbonfox = require("nightfox.palette").load("carbonfox").generate_spec(0)
      local palette = require("nightfox.palette").load("carbonfox")
      local Color = require("nightfox.lib.color")

      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            conditionals = "italic",
            constants = "bold",
            functions = "bold",
            keywords = "bold",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "italic",
            variables = "NONE",
          },
          inverse = {
            -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        },
        groups = {
          carbonfox = {
            CursorLine = { bg = Color.from_hex(palette.bg2) },
            Visual = { bg = Color.from_hex(palette.fg3), fg = Color.from_hex(palette.bg0), style = "bold" },
          },
        },
      })
    end,
  },
  {
    "git@github.com:phuoc101/LazyVim.git",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
