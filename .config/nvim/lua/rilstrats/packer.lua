vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- color theme
    use 'folke/tokyonight.nvim'
    -- use 'Mofiqul/vscode.nvim'

    -- telescope
    -- use 'nvim-lua/plenary.nvim'
    -- use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
      
end)
