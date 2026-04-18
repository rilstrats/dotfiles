return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

    },
    config = function()
      local vimgrep_arguments = {
        unpack(require('telescope.config').values.vimgrep_arguments),
      }
      -- search hidden
      table.insert(vimgrep_arguments, '--hidden')
      -- don't search git
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      local telescope = require('telescope')
      require('telescope').setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_command = {
            'rg',
            '--files',
            '--hidden',
            '--glob',
            '!**/.git/*'
          },
        },
      })
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
      require("config.telescope.multigrep").setup()
    end
  },
}
