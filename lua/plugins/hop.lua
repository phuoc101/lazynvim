return {
  "phaazon/hop.nvim",
  branch = "v1", -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    vim.keymap.set("n", "F", "<cmd>HopChar1<CR>", { desc = "Hop character" })
    vim.keymap.set("v", "F", "<cmd>HopChar1<CR>", { desc = "Hop character" })
  end,
}
