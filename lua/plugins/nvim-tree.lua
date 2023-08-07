return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    lazy = true,
    keys = {
      {"<leader>t", "<cmd>:NvimTreeToggle<CR>", desc = "NvimTree" },
    },
    version = "*",
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
            -- quit_on_open = true,
          },
        }
      }
    end,
  }
}
