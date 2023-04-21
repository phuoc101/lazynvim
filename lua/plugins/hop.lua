return {
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true,
        dim = true,
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection
      -- you can configure Hop the way you like here; see :h hop-config
      hop.setup({ keys = "etovxqpdygfblzhckisuran" })

      vim.keymap.set({ "v" }, "<leader>f", "<cmd>HopChar2<CR>", { remap = true })
    end,
  },
}
