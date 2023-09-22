--Custom keymaps
vim.keymap.set('n', '<F3>', "<cmd>:lua require('custom.utils').build_conditional()<cr>", {desc = 'Build Project'})
vim.keymap.set('n', '<F8>', "<cmd>:lua require('custom.utils').run_project()<cr>", { desc = 'Build Project' })
vim.keymap.set('n', '<F9>', "<cmd>:lua require('custom.utils').build_conditional_and_run()<cr>", { desc = 'Build Project and run it' })
vim.keymap.set('n', '<leader>s', "<cmd>:w<cr>", {desc = 'Save buffer'})
--Addition to Floaterm
vim.keymap.set('t', '<C-d>' , "<C-\\><C-n>", {desc = 'Go to normal mode in terminal' })
--Move from window to window
vim.cmd('nmap <space> <Nop>')
vim.keymap.set('n', '<space>k', '<C-w>k', {desc = 'Move to window above'})
vim.keymap.set('n', '<space>j', '<C-w>j', {desc = 'Move to window below'})
vim.keymap.set('n', '<space>h', '<C-w>h', {desc = 'Move to window on the left'})
vim.keymap.set('n', '<space>l', '<C-w>l', {desc = 'Move to window on the right'})
--Split window
vim.keymap.set('n', '<space>v', '<C-w>v', {desc = 'Split window vertically'})
vim.keymap.set('n', '<space>s', '<C-w>s', {desc = 'Split window horizontally'})
--New windows
vim.keymap.set('n', '<space>n', '<cmd>:vnew<cr>', {desc = 'New window vertically'})
vim.keymap.set('n', '<space>m', '<C-w><C-n>', {desc = 'New window vertically'})
--Close window
vim.keymap.set('n', '<space>q', '<C-w>q', {desc = 'Close window'})
--Rotate window
vim.keymap.set('n', '<space>r', '<C-w>r', {desc = 'Rotate window downwards/rightwards'})
vim.keymap.set('n', '<space>t', '<C-w>R', {desc = 'Rotate window upwards/leftwards'})
vim.keymap.set('n', '<space>e', '<C-w>x', {desc = 'Exchange window with next one'})
--Resize window
vim.keymap.set('n', '<space><Up>', '<cmd>:res +10<cr>', {desc = 'Increse window height by 5'})
vim.keymap.set('n', '<space><Down>', '<cmd>:res -10<cr>', {desc = 'Decrease window height by 5'})
vim.keymap.set('n', '<space><Right>', '<cmd>:vert res +20<cr>', {desc = 'Increse window width by 5'})
vim.keymap.set('n', '<space><Left>', '<cmd>:vert res -20<cr>', {desc = 'Decrease window width by 5'})

--Custom commands
vim.api.nvim_create_user_command('Setdir', "cd %:p:h", { nargs = 0})

