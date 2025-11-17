print("Advent of Neovim")

-- default tab size
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.have_nerd_font = true

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")
