return {
	{
		'ibhagwan/fzf-lua',
		opts = {
			keymap = {
				--[[
				builtin = {
					--inherit from defaults
					true,
					['<Tab>'] = 'preview-page-down',
					['<S-Tab>'] = 'preview-page-up'
				}
				--]]
			}
		},
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		keys = {
			{ '<leader>f', '<cmd>:lua require("fzf-lua").files()<cr>' },
			{ 'gr',        '<cmd>:lua require("fzf-lua").lsp_references()<cr>' }
		}
	}
}
