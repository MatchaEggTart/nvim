return {
  {
    -- sudo npm install -g emmet-ls
    "aca/emmet-ls",
    -- lazy = true,
    -- event = "VeryLazy",
    config = function()
      local lspconfig = require('lspconfig')
      local configs = require('lspconfig/configs')
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
  }
}
