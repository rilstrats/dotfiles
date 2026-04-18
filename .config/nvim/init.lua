vim.pack.add({
	"https://github.com/wakatime/vim-wakatime",
	"https://github.com/folke/tokyonight.nvim",
})

require("tokyonight").setup({
	transparent=true
})

vim.cmd.colorscheme("tokyonight")
-- require("vim-wakatime").setup()
