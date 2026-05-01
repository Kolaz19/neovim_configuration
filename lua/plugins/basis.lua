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
		config = true
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'neovim-treesitter/treesitter-parser-registry'
		},
		build = ":TSInstall lua vim vimdoc make xml html c && :TSUpdate",
		lazy = false,
		config = true,
	},
	{
		'kolaz19/marks-extended',
		lazy = true,
		branch = 'main',
		opts = {
			keybind_popup_close = '<ESC>',
			keybind_popup_delete_mark = '<CR>',
			popup_current_file_text = 'CURRENT_FILE',
			popup_show_local_first = false,
			popup_sort_by_line_number = true,
		},
		keys = {
			{ 'mm', '<cmd>:lua require("marks-extended").set_next_local_mark()<cr>' },
			{ 'mM', '<cmd>:lua require("marks-extended").set_next_global_mark()<cr>' },
			{ '<leader>w', '<cmd>:lua require("marks-extended").jump_to_next_global_mark()<cr>' },
			{ '<leader>q', '<cmd>:lua require("marks-extended").jump_to_previous_global_mark()<cr>' },
			{ '<leader>e', '<cmd>:lua require("marks-extended").jump_to_next_local_mark()<cr>' },
			{ '<leader>E', '<cmd>:lua require("marks-extended").jump_to_previous_local_mark()<cr>' },
			{ '<leader>d', '<cmd>:lua require("marks-extended").popup_delete_all_marks()<cr>' },
		}
	}
}
