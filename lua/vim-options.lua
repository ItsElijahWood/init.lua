vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.guicursor = {
    "n-v-c:block", -- Normal, Visual, and Command modes: block cursor
    "i:block",     -- Insert mode: block cursor
    "r-cr:hor20",  -- Replace and Command-line Replace modes: horizontal line cursor
    "o:hor50",     -- Operator-pending mode: half-height block cursor
}
vim.wo.number = true
vim.cmd [[
augroup TransparentBackground
    autocmd!
    autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi NormalNC guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi LineNr guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi SignColumn guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi StatusLine guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi StatusLineNC guibg=NONE ctermbg=NONE
augroup END
]]
