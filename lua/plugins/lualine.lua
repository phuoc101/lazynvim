return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              function()
                local curr_mode = {
                  n = "N",
                  i = "I",
                  v = "V",
                  [""] = "VB",
                  V = "VL",
                  c = "C",
                }
                return "" .. " " .. curr_mode[vim.fn.mode()]
              end,
              padding = { right = 1 },
              separator = { left = "", right = "" },
            },
          },
          lualine_b = {
            {
              "buffers",
              show_filename_only = true, -- Shows shortened relative path when set to false.
              hide_filename_extension = false, -- Hide filename extension when set to true.
              show_modified_status = true, -- Shows indicator when the buffer is modified.
              mode = 4, -- 0: Shows buffer name
              filetype_names = {
                TelescopePrompt = "Telescope",
                dashboard = "Dashboard",
                packer = "Packer",
                fzf = "FZF",
                alpha = "Alpha",
              }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
              use_mode_colors = true,
              symbols = {
                modified = " ●", -- Text to show when the buffer is modified
                directory = "", -- Text to show when the buffer is a directory
                alternate_file = "", -- Text to show to identify the alternate file
              },
            },
            {
              require("noice").api.status.mode.get,
              cond = require("noice").api.status.mode.has,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_c = {},
          lualine_x = {
            -- stylua: ignore
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
            { "branch" },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
            { "searchcount", color = { fg = "#ff9e64" } },
          },
          lualine_z = {
            {
              "fileformat",
              symbols = {
                unix = "UNIX ", -- e712
                dos = "WIN ", -- e70f
                mac = "MAC ", -- e711
              },
              fmt = string.upper,
              icons_enabled = true,
              separator = { left = "", right = "" },
            },
          },
        },
        extensions = { "neo-tree" },
      }
    end,
  },
}
