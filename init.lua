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

--[[
    GRAPPLLE
<leader>a = grapple tag
<leader>d = grapple untag
<leader>t = grapple popup
<leader>w = grapple cycle forward
<leader>q = grapple cycle backwards

    CMP
Ctrl+l = cmp jump to next argument
Ctrl+h = cmp jump to last argument
Ctrl+e = cmp abort completion
Shift+Tab = cmp select previous item in selection
Shift = cmp select next item in selection

    GITSIGNS
map('n', '<leader>p', gitsigns.preview_hunk)
map('n', '<leader>o', gitsigns.toggle_current_line_blame)
map('n', '<leader>l', gitsigns.reset_hunk)
map('n', '<leader>;', gitsigns.reset_buffer)

    LSPCONFIG
vim.keymap.set('n', 'go', vim.diagnostic.open_float)
vim.keymap.set('n', 'gO', vim.diagnostic.setqflist)
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, opts)

    OIL
["<CR>"] = "actions.select",
["<TAB>"] = "actions.select",
["g?"] = "actions.show_help",
["<C-v>"] = "actions.select_vsplit",
["<C-s>"] = "actions.select_split",
["<C-t>"] = "actions.select_tab",
["<C-p>"] = "actions.preview",
["<C-r>"] = "actions.refresh",
["<C-n>"] = "actions.close",
["<ESC>"] = "actions.close",
--Only useful without floating window
["<C-u>"] = "actions.preview_scroll_up",
["<C-d>"] = "actions.preview_scroll_down",
["-"] = "actions.parent",
["_"] = "actions.open_cwd",
["`"] = "actions.cd",
["~"] = "actions.tcd",
["gs"] = "actions.change_sort",
["gx"] = "actions.open_external",
["g."] = "actions.toggle_hidden",
["g\\"] = "actions.toggle_trash",
vim.keymap.set("n", "<C-n>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

--]]
