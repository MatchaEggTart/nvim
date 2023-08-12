return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    -- event = "VeryLazy",
    -- lazy = false,
    opts = {
    },
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        -- light_style = "night", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
        styles = {
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent", -- style for sidebars, see below
        }
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  -- lualine
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
          -- https://kgithub.com/ryanoasis/powerline-extra-symbols
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
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    -- lazy = true,
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    lazy = true,
    keys = {
      {"<leader>t", "<cmd>:NvimTreeToggle<CR>", desc = "NvimTree" },
    },
    config = function()
      require("nvim-tree").setup {
        sort_by = "case_sensitive",
        view = {
          adaptive_size = true,
          mappings = {
            list = {
              -- { key = "u", action = "dir_up" },
            },
          },
          -- 宽度
          width = 40,
          -- 也可以 'right'
          side = 'left',
          -- 隐藏根目录
          hide_root_folder = false,
          -- 不显示行数
          number = false,
          relativenumber = false,
          -- 显示图标
          signcolumn = 'yes',
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
          -- 隐藏 .文件 和 node_modules 文件夹
          custom = { 'node_modules' },
        },
        git = {
          enable = true,
        },
        actions = {
          open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
          },
        }
      }
    end,
  },

  -- bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
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
              filetype = "NvimTree",
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
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup()
    end,
  }
}
