--Global settings
vim.g.mapleader = ','
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.autochdir = false
vim.opt.shiftwidth = 4
vim.opt.ignorecase = false
vim.opt.wrap = false
vim.opt.breakindent = true


--Powershell configuration
vim.o.shell = 'pwsh'
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

--Custom
require("custom.keymaps")
vim.cmd('Setdir') -- Set Powershell terminal to cwd at startup

--Plugin Manager Lazy
require("plugin_configs.lazy-config")

--Terminal (Powershell) window color
vim.api.nvim_set_hl(0, "Floaterm", {bg = "#012456"})
vim.api.nvim_set_hl(0, "FloatermBorder", {fg = "#c19c00"})
