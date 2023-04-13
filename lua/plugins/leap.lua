return {
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({ "n", "v" }, "J", function()
        local current_window = vim.fn.win_getid()
        require("leap").leap({ target_windows = { current_window } })
      end)
    end,
  },
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}

      ret[1] = { "f", mode = { "n", "x", "o" }, desc = "f" }
      ret[1] = { "F", mode = { "n", "x", "o" }, desc = "F" }
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
}
