vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- color
    use 'folke/tokyonight.nvim'
    -- use 'mhartington/oceanic-next'
    -- use 'Mofiqul/vscode.nvim'

    -- coc
    use {'neoclide/coc.nvim', branch = 'release'}

    -- telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'
    use 'nvim-treesitter/nvim-treesitter'
    use 'kyazdani42/nvim-web-devicons'
    
    -- harpoon
    use {'ThePrimagen/harpoon', requires = {{'nvim-lua/plenary.nvim'}}}
      
end)
