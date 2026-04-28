return {
	{ --LUALINE
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
		opts = {
			options = { theme = 'onedark' },
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'filetype' },
				lualine_c = { 'filename' },
				lualine_x = { 'diagnostics' },
				lualine_y = { 'branch' },
				lualine_z = { 'location' },
			}
		}
	},
	{
		'williamboman/mason.nvim',
		lazy = false,
		--calls mason.setup()
		config = true
	},
	{
		'hrsh7th/cmp-nvim-lsp',
		lazy = true
	},
	{
		'saadparwaiz1/cmp_luasnip',
		lazy = true
	},
	{
		'neovim-treesitter/treesitter-parser-registry',
		lazy = true
	},
	{
	  "dimtion/guttermarks.nvim",
	  lazy = false,
	  event = { "BufReadPost", "BufNewFile", "BufWritePre", "FileType" },
	}

}
