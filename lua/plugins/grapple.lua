return {
	{
		'cbochs/grapple.nvim',
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ '<leader>a', '<cmd>:lua require("grapple").tag()<cr>',            'Grapple Tag File' },
			{ '<leader>d', '<cmd>:lua require("grapple").untag()<cr>',          'UnGrapple Tag File' },
			{ '<leader>t', '<cmd>:lua require("grapple").toggle_tags()<cr>',    'Toggle Grapple File' },
			{ '<leader>w', '<cmd>:lua require("grapple").cycle_forward()<cr>',  'Grapple Cycle Forward' },
			{ '<leader>q', '<cmd>:lua require("grapple").cycle_backward()<cr>', 'Grapple Cycle Backward' },
		},
		lazy = true,
		opts = {
			--Can be either the name of a builtin scope resolver,
			--or a custom scope resolver
			--@type string | Grapple.ScopeResolver
			scope = "git",

			--The save location for tags
			--@type string
			--save_path = tostring(Path:new(vim.fn.stdpath("data")) / "grapple"),

			--Window options used for the popup menu
			win_opts = {
				relative = "editor",
				width = 60,
				height = 12,
				style = "minimal",
				focusable = false,
				border = "single",
				footer_pos = "center"
			}
		}
	}
}
