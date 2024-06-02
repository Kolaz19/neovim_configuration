--Global settings
vim.g.mapleader = ','
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.autochdir = false
vim.opt.shiftwidth = 4
vim.opt.ignorecase = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.showtabline = 0
vim.g.termdebug_wide = 163
vim.cmd("set nohlsearch")

--Vim does detect h files as cpp
vim.g.c_syntax_for_h = 1
vim.filetype.add(
{ extension = { script = 'lua' }}
)

--Custom
require("custom.keymaps")

--Plugin Manager Lazy
require("plugin_configs.lazy-config")

--Only set cwd for grapple when initial buffer is not empty
if vim.api.nvim_buf_get_name(0) ~= '' then
    vim.cmd("Setdir")
end
