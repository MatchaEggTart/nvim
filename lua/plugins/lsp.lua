return {

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
      },
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
        -- sudo npm install -g --save vscode-html-languageservice
        -- on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vscode-html-language-server", "--stdio" },
        -- }
        filetypes = {
          "html",
        },
        -- autostart = true,
      }

      -- sudo npm install -g typescript typescript-language-server 
      lspconfig.tsserver.setup {
        capabilities = capabilities,
        single_file_support = true,
        init_options = {
          preferences = {
            includeCompletionsWithSnippetText = true,
            includeCompletionsWithInsertText = true,
          },
          filetypes = { "js", "javascript", "typescript", "typescriptreact", "typescript.tsx" },
          autostart = true,
          cmd = { "typescript-language-server", "--stdio" },
        }
      }

      -- Lua
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        -- Setup language servers.
        -- cmd = { "lua-language-server" },
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
  },

  -- Mason
  {
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
  },

  -- emmet
  {
    -- sudo npm install -g emmet-ls
    "aca/emmet-ls",
    -- lazy = true,
    -- event = "VeryLazy",
    config = function()
      local lspconfig = require('lspconfig')
      -- local configs = require('lspconfig/configs')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.emmet_ls.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "css",
          "eruby",
          "html",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          -- "javascript",
          -- "javascriptreact",
          -- "typescriptreact",
          "vue",
        },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        }
      })
    end,
  },
}
