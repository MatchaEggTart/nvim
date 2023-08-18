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
