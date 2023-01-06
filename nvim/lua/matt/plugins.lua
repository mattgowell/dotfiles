vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'mbbill/undotree'
    use 'tpope/vim-surround'

    use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use {
          'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} , {'BurntSushi/ripgrep'}}
    }
end)
