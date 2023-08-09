return {
  {
    "nvim-lualine/lualine.nvim",
    -- priority = 1000,
    opts = {},
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    config = function()
      require('lualine').setup{
        options = {
          theme = "tokyonight",
          -- component_separators = { left = "|", right = "|" },
          component_separators = { left = '|', right = '|'},
          -- https://github.com/ryanoasis/powerline-extra-symbols
          section_separators = { left = " ", right = "" },
        },
        extensions = {
          "nvim-tree",
          "toggleterm"
        },
        sections = {
          lualine_b = {
            {
              "branch",
              "diff" ,
            }
          },
          lualine_c = {
            "filename",
            {
              "lsp_progress",
              spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
            {
              'diagnostics',

              -- Table of diagnostic sources, available sources are:
              --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
              -- or a function that returns a table as such:
              --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
              sources = { 'nvim_diagnostic', 'coc' },

              -- Displays diagnostics for the defined severity types
              sections = { 'error', 'warn', 'info', 'hint' },

              diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
              },
              symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
              colored = true,           -- Displays diagnostics status in color if set to true.
              update_in_insert = false, -- Update diagnostics in insert mode.
              always_visible = false,   -- Show diagnostics even if there are none.
            }
          },
          lualine_x = {
            "filesize",
            {
              "fileformat",
              symbols = {
                unix = ' | LF', -- e712
                dos = ' | CRLF', -- e70f
                mac = ' | CR', -- e711
              },
            },
            "encoding",
            "filetype",
          },
        },
      }
    end,
  }
}
