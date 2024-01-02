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
    {--MARKS
	'chentoast/marks.nvim',
	config = function()
	    require("plugin_configs.marks-config")
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
    {--LUALINE
	'nvim-lualine/lualine.nvim',
	config = function()
	    require('lualine').setup {
		options = { theme  = 'onedark' }
	    }
	end
    },
    {--LSP
	'neovim/nvim-lspconfig',
	lazy = true,
	ft = {"c","h","lua","ps1","markdown"},
	dependencies = {
	    'williamboman/mason-lspconfig.nvim',
	    'hrsh7th/nvim-cmp',
	},
	config = function()
	    require("plugin_configs.lspconfig-config")
	end
    },
    {
	'williamboman/mason-lspconfig.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	lazy = true,
	config = function()
	    require("mason-lspconfig").setup {
		ensure_installed = { "clangd", "lua_ls", "marksman", "powershell_es" },
		automatic_installation = false,
		handlers = nil,
	    }
	end
    },
    {
	'williamboman/mason.nvim',
	lazy = true,
	config = function()
	    require("mason").setup()
	end
    },
    {--AUTOCOMPLETION
	'hrsh7th/nvim-cmp',
	--We can't lazy load NVIM-CMP on it's own,
	--because we use it to update the capabilities
	--in our lspconfig-config
	lazy = true,
	dependencies = {
	    'hrsh7th/cmp-nvim-lsp',
	    'L3MON4D3/LuaSnip',
	    'saadparwaiz1/cmp_luasnip',
	},
	config = function()
	    require("plugin_configs.cmp-config")
	end
    },
    {
	'hrsh7th/cmp-nvim-lsp',
	lazy = true
    },
    {
	'L3MON4D3/LuaSnip',
	lazy = true
    },
    {
	'saadparwaiz1/cmp_luasnip',
	lazy = true
    },
})
