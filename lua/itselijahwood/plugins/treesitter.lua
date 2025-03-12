return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "go", "lua", "javascript", "php"},
      highlight = { enable = true },
    })
  end
}

