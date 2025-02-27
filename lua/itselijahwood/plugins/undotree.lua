return {
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("undotree").setup()
      vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
      vim.opt.undofile = true
    end,
  }
}
