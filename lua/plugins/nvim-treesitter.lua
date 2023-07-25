return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
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
    end
  }
}
