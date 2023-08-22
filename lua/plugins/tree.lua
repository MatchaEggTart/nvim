return {

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = true,
    keys = {
      { "<leader>t", "<cmd>Neotree toggle<CR>", desc = "Neotree" },
    },
    config = function()
      -- code
      require("neo-tree").setup({
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            -- folder_empty = "󰜌",
            folder_empty = "empty folder ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖", -- this can only be used in the git_status source
              renamed   = "󰁕", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              -- unstaged  = "󰄱",
              unstaged  = "U",
              staged    = "",
              conflict  = "",
            }
          },
        },
      })
    end
  },

  --[[
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
      { "<leader>t", "<cmd>:NvimTreeToggle<CR>", desc = "NvimTree" },
    },
    config = function()
      local function my_on_attach(bufnr)
        local tree = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- default mappings
        tree.config.mappings.default_on_attach(bufnr)
      end

      require("nvim-tree").setup({
        on_attach = my_on_attach,
        sort_by = "case_sensitive",
        view = {
          adaptive_size = true,
          -- 宽度
          width = 40,
          -- 也可以 'right'
          side = "left",
          -- 隐藏根目录
          hide_root_folder = false,
          -- 不显示行数
          number = false,
          relativenumber = false,
          -- 显示图标
          signcolumn = "yes",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
          -- 隐藏 .文件 和 node_modules 文件夹
          custom = { "node_modules" },
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
        },
      })
    end,
  },
  ]] --

}
