return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          -- :TSInstall 要加参数(安装的语言)
          "vim",
          "vimdoc",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "bash",
          "c",
          "java",
          "rust",
          "python", 
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "query",
          "regex",
          "yaml", -- sudo dnf install g++ -y
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
      -- 开启 Folding 模块
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      -- 默认不要折叠
      -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
      vim.opt.foldlevel = 99
    end
  }
}
