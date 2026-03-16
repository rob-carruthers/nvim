-- Vim options

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- ruler
vim.opt.colorcolumn = "100"

-- disable netrw directory browser
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable two slots in the sign gutter column; diagnostics and gitsigns
vim.opt.signcolumn = "yes:2"
