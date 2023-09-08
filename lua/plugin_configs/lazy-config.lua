local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    {--ONEDARK
	'navarasu/onedark.nvim',
	config = function()
	    require("plugin_configs.onedark-config")
	    require('onedark').load()
	end
    },
    
    {--TREE
	'nvim-tree/nvim-tree.lua',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	lazy = true,
	keys = { 
	    { "<C-n>" }
	},
	config = function()
	    require("plugin_configs.tree-config")
	end
    },
    
    {--DEVICONS
	'nvim-tree/nvim-web-devicons',
	config = function()
	    require("plugin_configs.web_devicons-config")
	end
    },
    
    {--TREESITTER
	'nvim-treesitter/nvim-treesitter',
	build = {":TSUpdate"},
	config = function() 
	    require("plugin_configs.treesitter-config")
	end
    },

    {--HARPOON
	'ThePrimeagen/harpoon',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
	    require("plugin_configs.harpoon-config")
	end
    },
    
    {--LUALINE
	'nvim-lualine/lualine.nvim',
	config = function()
	    require('lualine').setup {
		options = { theme  = 'onedark' }
	    }
	end
    },
    {--FLOAT TERMINAL
	'voldikss/vim-floaterm',
	lazy = true,
	keys = { 
	    { "<leader>t" }
	},
	config = function() 
	    require("plugin_configs.floaterm-config")
	end
    },

    'nvim-lua/plenary.nvim',
    
    --LSP
    {
	'williamboman/mason.nvim',
	config = function()
	    require("mason").setup()
	end
    },
    {
	'williamboman/mason-lspconfig.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	config = function()
	    require("mason-lspconfig").setup {
		ensure_installed = {},
		automatic_installation = false,
		handlers = nil,
	    }
	end
    },
    {
	'neovim/nvim-lspconfig',
	dependencies = { 'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim' },
	config = function()
	    require("plugin_configs.lspconfig-config")
	end
    }
})
