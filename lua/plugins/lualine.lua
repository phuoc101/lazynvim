return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      local icons = require("lazyvim.config").icons

      -- local function fg(name)
      --   return function()
      --     ---@type {foreground?:number}?
      --     local hl = vim.api.nvim_get_hl_by_name(name, true)
      --     return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      --   end
      -- end

      local theme_colors = require("lualine.themes.carbonfox")
      theme_colors.visual.a.bg = "#c678dd"

      local function get_lsp()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
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
              padding = { left = 1, right = 1 },
              separator = { left = "", right = "" },
              color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                  n = theme_colors.normal.a.bg,
                  i = theme_colors.insert.a.bg,
                  v = theme_colors.visual.a.bg,
                  [""] = theme_colors.visual.a.bg,
                  V = theme_colors.visual.a.bg,
                  c = theme_colors.command.a.bg,
                }
                return { fg = mode_color[vim.fn.mode()], bg = "#282828", gui = "bold" }
              end,
            },
          },
          lualine_b = {
            {
              "filetype",
              colored = true, -- Displays filetype icon in color if set to true
              icon_only = true, -- Display only an icon for filetype
              icon = { align = "right" }, -- Display filetype icon on the right hand side
              separator = "",
              padding = { left = 1, right = 0 },
            },
            {
              "filename",
              file_status = true, -- Displays file status (readonly status, modified status)
              newfile_status = false, -- Display new file status (new file means no write after created)
              path = 1, -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory

              shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = " ●", -- Text to show when the buffer is modified
                directory = "", -- Text to show when the buffer is a directory
                alternate_file = "", -- Text to show to identify the alternate file
                readonly = "", -- Text to show when the file is non-modifiable or readonly.
                unnamed = "[No Name]", -- Text to show for unnamed buffers.
                newfile = "[New]", -- Text to show for newly created file before first write
              },
              separator = { right = "" },
            },
            -- {
            --   require("noice").api.status.mode.get,
            --   cond = require("noice").api.status.mode.has,
            --   color = { fg = "#ff9e64" },
            -- },
          },
          lualine_c = {
            -- Lsp server name .
          },
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
              get_lsp,
              icon = " LSP:",
            },
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
              color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                  n = theme_colors.normal.a.bg,
                  i = theme_colors.insert.a.bg,
                  v = theme_colors.visual.a.bg,
                  [""] = theme_colors.visual.a.bg,
                  V = theme_colors.visual.a.bg,
                  c = theme_colors.command.a.bg,
                }
                return { fg = mode_color[vim.fn.mode()], bg = "#282828", gui = "bold" }
              end,
            },
          },
        },
        extensions = { "neo-tree" },
      }
    end,
  },
}
