return {

  -- which-key
  {
    "folke/which-key.nvim",
    config = true,
  },

  -- 选中字符，高亮同名字符
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure()
    end
  },

  -- 显示 git 修改内容
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = false --- check bracket in same line
    },                                  -- this is equalent to setup({}) function
  },

  -- Lastplace
  {
    "ethanholz/nvim-lastplace",
    config = true,
  },

  -- 驼峰检查
  {
    "kamykn/spelunker.vim",
    config = function()
      vim.g.spelunker_check_type = 2
    end
  },

  -- Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    --@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },

}
