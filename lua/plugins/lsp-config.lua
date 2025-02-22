return {
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
                ensure_installed = {
                    "intelephense", -- PHP
                    "pyright",      -- Python
                    "clangd",       -- C++
                    "ts_ls",     -- TypeScript/JavaScript (correct name)
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Replace Phpactor with Intelephense
            lspconfig.intelephense.setup({
                cmd = { "C:\\Users\\ejthe\\AppData\\Roaming\\npm\\intelephense", "--stdio" }, -- Explicit path
                filetypes = { "php" },
                root_dir = function(fname)
                    return lspconfig.util.find_git_ancestor(fname)
                        or lspconfig.util.root_pattern("composer.json", ".git")(fname)
                        or lspconfig.util.path.dirname(fname)
                end,
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

            -- Other LSPs
            lspconfig.ts_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.clangd.setup({})
        end,
    },
}

