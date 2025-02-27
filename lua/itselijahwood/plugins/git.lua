return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '-' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },
        preview_config = {
          border = 'rounded',
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gh', '&gitsigns.preview_hunk()', { noremap = true })
        end,
      }
    end
  }
}

