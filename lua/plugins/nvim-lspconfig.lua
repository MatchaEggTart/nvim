return {
  "neovim/nvim-lspconfig",
  -- event = "VeryLazy",
  -- lazy = true,
    dependencies = {
      -- "nvim-lua/lsp-status.nvim",
    },
  config = function()
    -- local lsp_status = require('lsp-status')
    -- lsp_status.register_progress()
    -- Setup language servers.
    local lspconfig = require('lspconfig')

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- local on_attach = require("lsp.lsp-attach").on_attach
    -- HTML
    lspconfig.html.setup {
      -- settings = {
      -- sudo npm install -g --save vscode-html-languageservice
      -- on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "vscode-html-language-server", "--stdio" },
      -- }
      filetypes = {
        "html",

      },
    }

    -- sudo npm install -g typescript-language-server 
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      autostart = true,
      cmd = { "typescript-language-server", "--stdio" },
    }

    -- Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      -- Setup language servers.

      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {"vim"},
          },
          workspace = {
            checkThirdParty = false,
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
}
