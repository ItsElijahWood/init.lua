-- --- Git Stuff ---
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", {})
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", {})

-- --- Code Actions ---
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>cx", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})

-- --- Navigation Methods LSP ---
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})

-- --- Custom Keybinds ---
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", {})
vim.keymap.set("v", "<leader>y", '"+y', {})
