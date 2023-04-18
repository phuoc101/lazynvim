-- return {
--   {
--     "f3fora/nvim-texlabconfig",
--     config = function()
--       local config = {
--         cache_activate = true,
--         cache_filetypes = { "tex", "bib" },
--         cache_root = vim.fn.stdpath("cache"),
--         reverse_search_start_cmd = function()
--           return true
--         end,
--         reverse_search_edit_cmd = vim.cmd.edit,
--         reverse_search_end_cmd = function()
--           return true
--         end,
--         file_permission_mode = 438,
--       }
--       require("texlabconfig").setup(config)
--       require("lspconfig").texlab.setup({
--         settings = {
--           texlab = {
--             auxDirectory = ".",
--             build = {
--               executable = "latexmk",
--               args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
--               onSave = true,
--               forwardSearchAfter = true,
--             },
--             bibtexFormatter = "texlab",
--             diagnosticsDelay = 300,
--             formatterLineLength = 80,
--             forwardSearch = {
--               -- executable = "sioyek",
--               -- args = {
--               --   "--reuse-window",
--               --   "--inverse-search",
--               --   [[nvim-texlabconfig -file %1 -line %2]],
--               --   "--forward-search-file",
--               --   "%f",
--               --   "--forward-search-line",
--               --   "%l",
--               --   "%p",
--               -- },
--               executable = "zathura",
--               args = {
--                 "--synctex-editor-command",
--                 [[nvim-texlabconfig -file '%{input}' -line %{line}]],
--                 "--synctex-forward",
--                 "%l:1:%f",
--                 "%p",
--               },
--             },
--             latexindent = {
--               modifyLineBreaks = true,
--             },
--           },
--         },
--       })
--     end,
--     -- ft = { 'tex', 'bib' }, -- for lazy loading
--     build = "go build -o ~/.local/bin",
--   },
--
-- }
--
return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_forward_search_on_start = false
      vim.g.vimtex_toc_config = {
        mode = 1,
        fold_enable = 0,
        hide_line_numbers = 1,
        resize = 0,
        refresh_always = 1,
        show_help = 0,
        show_numbers = 1,
        split_pos = "leftabove",
        split_width = 30,
        tocdeth = 3,
        indent_levels = 1,
        todo_sorted = 1,
      }
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
      }
    end,
  },
}
