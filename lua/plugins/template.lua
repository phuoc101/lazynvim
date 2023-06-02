return {
  "glepnir/template.nvim",
  cmd = { "Template" },
  config = function()
    require("template").setup({
      author = "Phuoc Nguyen Thuan",
      email = "nguyenthuanphuoc101@protonmail.com",
      temp_dir = "~/.config/nvim/template",
    })
  end,
}
