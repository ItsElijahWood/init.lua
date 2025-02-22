return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "onsails/lspkind-nvim" }, -- Add lspkind for icons and text
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",  -- Show both symbol and text for better readability
                        maxwidth = 20,         -- Limit the width of the completion menu
                        ellipsis_char = "...", -- Show ellipsis for truncated entries
                        menu = {
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                        },
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-y>"] = cmp.mapping.select_prev_item(), -- Navigate up in completion menu
                    ["<C-n>"] = cmp.mapping.select_next_item(), -- Navigate down
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Leader>y"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP source
                    { name = "luasnip" },  -- Snippet source
                }, {
                    { name = "buffer" },   -- Buffer source
                }),
            })
        end,
    },

    {
        "neovim/nvim-lspconfig", -- Add LSP support
        config = function()
            require("lspconfig").intelephense.setup({
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 5000000, -- Increase file size limit if needed
                        },
                        diagnostics = {
                            enable = true,
                        },
                    },
                },
            })
        end,
    },
}

