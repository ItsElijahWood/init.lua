return { 
	{'nvim-telescope/telescope.nvim', 
    dependencies = { 
      {'nvim-lua/plenary.nvim'}, 
    },
    config = function()
      require('telescope').setup{
        defaults = {
          -- your telescope configuration here
        }
      }
    end
  },
}
