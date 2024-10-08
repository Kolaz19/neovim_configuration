--Custom keymaps
vim.keymap.set('n', '<F3>', "<cmd>:lua require('custom.utils').build_conditional()<cr>", { desc = 'Build Project' })
vim.keymap.set('n', '<F8>', "<cmd>:lua require('custom.utils').run_project()<cr>", { desc = 'Build Project' })
vim.keymap.set('n', '<F9>', "<cmd>:lua require('custom.utils').build_conditional_and_run()<cr>", { desc = 'Build Project and run it' })
--Tab switch
vim.keymap.set('n', '<F2>', "<cmd>:tabn<cr>", { desc = 'Jump to next tab' })
vim.keymap.set('t', '<F2>', "<cmd>:tabn<cr>", { desc = 'Jump to next tab' })
--Move from window to window
vim.cmd('nmap <space> <Nop>')
vim.keymap.set('n', '<Up>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<Down>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<Left>', '<C-w>h', { desc = 'Move to window on the left' })
vim.keymap.set('n', '<Right>', '<C-w>l', { desc = 'Move to window on the right' })
--Split window
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>s', '<C-w>s', { desc = 'Split window horizontally' })
--New windows
vim.keymap.set('n', '<leader>b', '<cmd>:vnew<cr>', { desc = 'New window vertically' })
vim.keymap.set('n', '<leader>g', '<C-w><C-n>', { desc = 'New window horizontally' })
--Rotate window
vim.keymap.set('n', '<leader>z', '<C-w>r', { desc = 'Rotate window downwards/rightwards' })
vim.keymap.set('n', '<leader>Z', '<C-w>R', { desc = 'Rotate window upwards/leftwards' })
vim.keymap.set('n', '<leader>x', '<C-w>x', { desc = 'Exchange window with next one' })
--Resize window
vim.keymap.set('n', '<S-Up>', '<cmd>:res +10<cr>', { desc = 'Increase window height by 5' })
vim.keymap.set('n', '<S-Down>', '<cmd>:res -10<cr>', { desc = 'Decrease window height by 5' })
vim.keymap.set('n', '<S-Right>', '<cmd>:vert res +20<cr>', { desc = 'Increse window width by 5' })
vim.keymap.set('n', '<S-Left>', '<cmd>:vert res -20<cr>', { desc = 'Decrease window width by 5' })
--Quickfix List
vim.keymap.set('n', '<leader>n', '<cmd>cnext<cr>zz', { desc = 'Next item quickfix list' })
vim.keymap.set('n', '<leader>p', '<cmd>cprev<cr>zz', { desc = 'Previous item quickfix list' })

--Custom commands
vim.api.nvim_create_user_command('Setdir', "cd %:h", { nargs = 0 })
vim.api.nvim_create_user_command('Debugs', "packadd termdebug", { nargs = 0 })
vim.api.nvim_create_user_command('Debug', require('custom.utils').debug_this, { nargs = 1 })
