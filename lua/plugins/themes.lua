-- ~/.config/nvim/lua/plugins.lua

return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,    -- Load the theme immediately
        priority = 1000, -- Ensure it loads before other plugins
        config = function()
            require('rose-pine').setup({
                variant = 'main', -- Can be 'main', 'moon', or 'dawn'
                disable_background = true,
            })
            vim.cmd('colorscheme rose-pine')
        end,
    },
}

--[[ return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            -- transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
} ]]
