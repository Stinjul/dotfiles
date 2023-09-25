local opt = vim.opt
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

vim.g.mapleader = ","

vim.keymap.set("n", "<leader>a", ":ArgWrap<CR>", { silent = true, noremap = true })
