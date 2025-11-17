return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd.colorscheme "tokyonight" end,
  },
  { 'xiyaowong/transparent.nvim', lazy = false },
}
