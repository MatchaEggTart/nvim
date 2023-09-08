return {

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "VeryLazy",
        -- build = ":MasonUpdate",
      },
      {
        "williamboman/mason-lspconfig"
      },
      -- 每个项目可以创建单独的nvim配置
      -- 跟exrc差不多
      -- 在目录创建 .neoconf.json
      {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
        config = false,
        dependencies = { "nvim-lspconfig" }
      },
      -- 正确识别 api，就像 vim 会 warning
      {
        "folke/neodev.nvim",
      },
      -- 右下角显示lsp情况
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
      },
      {
        "nvimdev/lspsaga.nvim",
        event = 'LspAttach',
        dependencies = {
          'nvim-treesitter/nvim-treesitter', -- optional
          'nvim-tree/nvim-web-devicons',     -- optional
        }
      },
    },
    opts = {
      servers = {

        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          -- ---@type LazyKeys[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                -- globals = { "vim", },
              },
              telemetry = {
                enable = false,
              }
            },
          },
        },

        tsserver = {
          cmd = { "typescript-language-server", "--stdio" },
        },

        html = {

        },
      },
    },
    config = function(_, opts)
      local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
        -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
        -- nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('gi', require("telescope.builtin").lsp_implementations, '[G]oto [I]mplementation')
        -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
        -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
        nmap('<leader>da', require("telescope.builtin").diagnostics, '[D]i[A]gnostics')
        nmap('gr', require("telescope.builtin").lsp_references, '[G]oto [R]eferences')
        -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap("<space>f", function()
          vim.lsp.buf.format { async = true }
        end, "[F]ormat code")
      end

      local servers = opts.servers
      -- 开启补全能力
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("neoconf").setup()
      require("neodev").setup()
      require("fidget").setup()
      require("lspsaga").setup()

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
          -- download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        --[[
          handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              settings = servers[server_name],
              on_attach = on_attach,
              capabilities = capabilities,
            }
          end,
        }
        ]]
      })

      for server, config in pairs(servers) do
        require("lspconfig")[server].setup(
          vim.tbl_deep_extend("keep",
            {
              on_attach = on_attach,
              capabilities = capabilities
            },
            config
          )
        )
      end
    end
  },

}
