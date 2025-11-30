return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({
        auto_update        = true,
        neovim_image_text  = "Neovim Editor",
        main_image         = "neovim",
        client_id          = "793271441293967371",
        log_level          = nil,
        debounce_timeout   = 10,
        enable_line_number = false,
        blacklist          = {},
        buttons            = false,
        show_time          = true,
      })
    end,
  }
}
