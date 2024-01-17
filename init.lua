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
--Vim does detect h files as cpp
vim.g.c_syntax_for_h = 1

--Custom
require("custom.keymaps")
vim.cmd('Setdir') -- Set terminal to cwd at startup

--Plugin Manager Lazy
require("plugin_configs.lazy-config")
