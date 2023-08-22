return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    dependencies = {
      "nvim-web-devicons",
    },
    priority = 1000,
    -- event = "VeryLazy",
    -- lazy = false,
    opts = {},
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night",    -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        -- light_style = "night", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
        styles = {
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent", -- style for sidebars, see below
        },
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    -- priority = 1000,
    opts = {},
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    -- lazy = false,
    event = "VeryLazy",

    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          -- component_separators = { left = "|", right = "|" },
          component_separators = { left = "|", right = "|" },
          -- https://kgithub.com/ryanoasis/powerline-extra-symbols
          section_separators = { left = " ", right = "" },
        },
        extensions = {
          "nvim-tree",
          "toggleterm",
        },
        sections = {
          lualine_b = {
            {
              "branch",
              "diff",
            },
          },
          lualine_c = {
            "filename",
            {
              "lsp_progress",
              spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
            {
              "diagnostics",

              -- Table of diagnostic sources, available sources are:
              --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
              -- or a function that returns a table as such:
              --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
              sources = { "nvim_diagnostic", "coc" },

              -- Displays diagnostics for the defined severity types
              sections = { "error", "warn", "info", "hint" },

              diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = "DiagnosticError", -- Changes diagnostics' error color.
                warn = "DiagnosticWarn",   -- Changes diagnostics' warn color.
                info = "DiagnosticInfo",   -- Changes diagnostics' info color.
                hint = "DiagnosticHint",   -- Changes diagnostics' hint color.
              },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              colored = true,           -- Displays diagnostics status in color if set to true.
              update_in_insert = false, -- Update diagnostics in insert mode.
              always_visible = false,   -- Show diagnostics even if there are none.
            },
          },
          lualine_x = {
            "filesize",
            {
              "fileformat",
              symbols = {
                unix = " | LF", -- e712
                dos = " | CRLF", -- e70f
                mac = " | CR", -- e711
              },
            },
            "encoding",
            "filetype",
          },
        },
      })
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
        -- close_command = "Bdelete! %d",
        -- right_mouse_command = "Bdelete! %d",
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
          {
            -- filetype = "NvimTree",
            filetype = "Neotree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or "")
            s = s .. n .. sym
          end
          return s
        end,
      },
    },
    keys = {
      -- 左右Tab切换
      { "<A-h>",      ":BufferLineCyclePrev<CR>",                          desc = "buffer left" },
      { "<A-l>",      ":BufferLineCycleNext<CR>",                          desc = "buffer right" },
      -- "moll/vim-bbye" 关闭当前 buffer
      { "<leader>bc", ":Bdelete!<CR>",                                     desc = "close select buffer" },
      -- 关闭左/右侧标签页
      { "<leader>bh", ":BufferLineCloseLeft<CR>",                          desc = "foldclose" },
      { "<leader>bl", ":BufferLineCloseRight<CR>",                         desc = "foldclose" },
      -- 关闭其他标签页
      { "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", desc = "foldclose" },
      -- 关闭选中标签页
      { "<leader>bp", ":BufferLinePickClose<CR>",                          desc = "foldclose" },
    },
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup()
    end,
  },

  -- lspsaga 必备
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = "VeryLazy",
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue").setup {
        theme = "tokyonight",
      }
    end,
  },

}
