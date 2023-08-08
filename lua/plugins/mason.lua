return {
  "williamboman/mason.nvim",
  -- build = ":MasonUpdate"
  dependencies = 'williamboman/mason-lspconfig.nvim',
  event = "VeryLazy",
  -- lazy = true,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      github = {
        -- download_url_template = "https://gitclone.com/github.com/%s/releases/download/%s/%s",
        download_url_template = "https://kgithub.com/%s/releases/download/%s/%s",
      },
    })
    require("mason-lspconfig").setup()
    require("lspconfig").lua_ls.setup {}
  end,
}
