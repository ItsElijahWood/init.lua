return {
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        -- variant = "moon",
        disable_background = true,
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}

