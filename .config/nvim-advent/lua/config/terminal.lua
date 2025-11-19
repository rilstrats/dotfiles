vim.api.nvim_create_autocmd('Termopen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

vim.keymap.set("n", "<leader>ot", function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)
