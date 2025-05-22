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
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		lazy = true,
		opts = {
			--ensure_installed = { "clangd", "lua_ls", "marksman", "powershell_es" },
			--All Servers setup with nvim-lspconfig should be installed
			automatic_installation = true,
			handlers = nil,
		}
	},
	{
		'williamboman/mason.nvim',
		lazy = true,
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
}
