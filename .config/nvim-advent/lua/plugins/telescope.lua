return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
    },
    config = function()
      require('telescope').setup { extensions = { fzf = {} } }
      require('telescope').load_extension('fzf')
      vim.keymap.set("n", "<leader>sf", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<leader>sg", require('telescope.builtin').live_grep)
      vim.keymap.set("n", "<leader>sb", require('telescope.builtin').buffers)
      vim.keymap.set("n", "<leader>sh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<leader>sn", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<leader>sp", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("data") .. "/lazy"
        }
      end)
      require "config.telescope.multigrep".setup()
    end
  },
}
