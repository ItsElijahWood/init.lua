return { 
  {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 
      {'nvim-lua/plenary.nvim'}, 
      {'nvim-tree/nvim-web-devicons'}, -- Add devicons dependency
    },
    config = function()
      require('telescope').setup{
        defaults = {
          prompt_prefix = " ", 
          selection_caret = " ", 
          entry_prefix = "  ",
          file_ignore_patterns = { "node_modules", ".git", ".env" },
        }
      }
    end
  },
}

