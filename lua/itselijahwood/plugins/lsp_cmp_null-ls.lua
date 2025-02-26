return {
  -- Mason and LSPConfig for PHP, JavaScript, and Lua
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"intelephense", "lua_ls" },  
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local mason_path = require("mason-registry").get_package("intelephense"):get_install_path()

lspconfig.intelephense.setup({
  cmd = { mason_path .. "/node_modules/.bin/intelephense", "--stdio" },  -- Point to the executable inside node_modules
  on_attach = function(client, bufnr) end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  root_dir = lspconfig.util.root_pattern(".git", "composer.json", "package.json"),  -- Adjust as needed
})



      -- JavaScript/TypeScript (tsserver)
      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr) end,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Lua (lua_ls)
      lspconfig.lua_ls.setup({})
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,  -- Integrate stylua for formatting
        },
      })
    end,
  },  

  -- nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buffer]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })
    end,
  },
}

