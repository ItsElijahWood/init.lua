vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pf', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pv', '<cmd>Ex<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>u', function()
  require('undotree').toggle()
end, { noremap = true, silent = true })

