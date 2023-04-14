return {
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection
      -- you can configure Hop the way you like here; see :h hop-config
      hop.setup({ keys = "etovxqpdygfblzhckisuran" })

      vim.keymap.set({ "n", "v" }, "F", "<cmd>HopChar2<CR>", { remap = true })
    end,
  },
}
