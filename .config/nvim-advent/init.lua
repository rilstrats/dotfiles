print("Advent of Neovim")

require("config.lazy")

-- default tab size
vim.opt.shiftwidth = 4

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- first arg is mode
-- :.lua just execs that line
-- :lua execs the highlighted portion
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

