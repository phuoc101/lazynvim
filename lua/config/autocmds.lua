-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds
--
-- Vimtex configuration
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "tex", "bib" },
  callback = function()
    vim.opt.relativenumber = false
    -- vim.opt.cursorline = false
    vim.opt.colorcolumn = ""
    vim.wo.number = false
  end,
})

-- CPP configuration
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp", "c", "python" },
  callback = function()
    vim.opt.colorcolumn = "120"
  end,
})
