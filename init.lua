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
vim.o.shell = 'powershell'
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

--Custom
require("custom.keymaps")
vim.cmd('Setdir') -- Set Powershell terminal to cwd at startup


--Plugin Packer
require("plugin_configs.packer-config")
--Filetree & Icons
require("plugin_configs.tree-config")
require("plugin_configs.web_devicons-config")
--Harpoon
require("plugin_configs.harpoon-config")
--Language
require("plugin_configs.treesitter-config")
--Appearance
require('lualine').setup {
  options = { theme  = 'onedark' }
}
require("plugin_configs.onedark-config")
require('onedark').load()
--[[
--Override color groups (:hi)
vim.api.nvim_set_hl(0, "CocHighlightText", {bg = "#1e3242"})
vim.api.nvim_set_hl(0, "CocFloating", {bg = "#5a5b5e"})
--vim.api.nvim_set_hl(0, "CocHighlightText", {bg = "#2c485f"})--#5a5b5e#2c485f
--]]
