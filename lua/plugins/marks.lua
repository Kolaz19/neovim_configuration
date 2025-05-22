return {
	{
		'chentoast/marks.nvim',
		lazy = false,
		opts = {
			default_mappings = false,
			cyclic = true,
			mappings = {
				toggle = 'mm',
				delete_buf = '<leader>d',
				next = '<leader>w',
				prev = '<leader>q',
				preview = 'm:',
			}
		},
	}
}
