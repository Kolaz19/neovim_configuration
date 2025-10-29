--Global settings
vim.g.mapleader = ","
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.autochdir = false

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.showtabline = 0
vim.g.termdebug_wide = 163
vim.wo.relativenumber = false
vim.cmd("set clipboard+=unnamedplus")

--Vim does detect h files as cpp
vim.g.c_syntax_for_h = 1
vim.filetype.add(
	{ extension = { script = 'lua' } }
)

vim.filetype.add { extension = { p8 = "p8" } }

--Only set cwd for grapple when initial buffer is not empty
vim.api.nvim_create_user_command('Setdir', "cd %:h", { nargs = 0 })
if vim.api.nvim_buf_get_name(0) ~= '' then
	vim.cmd("Setdir")
end
