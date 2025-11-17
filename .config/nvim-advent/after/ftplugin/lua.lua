vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- first arg is mode
-- :.lua just execs that line
-- :lua execs the highlighted portion
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
