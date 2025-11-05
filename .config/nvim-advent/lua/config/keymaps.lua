-- yank into clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank into clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'which_key_ignore' })

-- put from clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]], { desc = 'Put from clipboard' })
vim.keymap.set('n', '<leader>P', [["+P]], { desc = 'which_key_ignore' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
