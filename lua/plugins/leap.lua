return {
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({ "n", "v" }, "F", function()
        local current_window = vim.fn.win_getid()
        require("leap").leap({ target_windows = { current_window } })
      end)
    end,
  },
}
