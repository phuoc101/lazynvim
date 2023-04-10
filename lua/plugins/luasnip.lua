return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_vscode").load({ paths = "./snips/cpp" })
    require("luasnip.loaders.from_vscode").load({ paths = "./snips/python" })
    require("luasnip.loaders.from_vscode").load({ paths = "./snips/launch" })
    require("luasnip.loaders.from_vscode").load({ paths = "./snips/tex" })
  end,
}
