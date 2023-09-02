require("harpoon").setup {
	global_settings = {
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "git" },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,

		-- enable tabline with harpoon marks
		tabline = false,
		tabline_prefix = "   ",
		tabline_suffix = "   ",
	}
}
vim.keymap.set('n','<leader><TAB>', "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc = 'Toggle harpoon menu'})
vim.keymap.set('n','<leader>a', "<cmd>:lua require('harpoon.mark').add_file()<cr>", {desc = 'Add current file to harpoon'})

vim.keymap.set('n','<leader>1', "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>", {desc = 'Navigate to file 1'})
vim.keymap.set('n','<leader>2', "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>", {desc = 'Navigate to file 2'})
vim.keymap.set('n','<leader>3', "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", {desc = 'Navigate to file 3'})
vim.keymap.set('n','<leader>4', "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>", {desc = 'Navigate to file 4'})

vim.keymap.set('n','<leader>w', "<cmd>:lua require('harpoon.ui').nav_next()<cr>", {desc = 'Navigate to next file'})
vim.keymap.set('n','<leader>q', "<cmd>:lua require('harpoon.ui').nav_prev()<cr>", {desc = 'Navigate to previous file'})
