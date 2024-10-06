require("grapple").setup({

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
    },
})


vim.keymap.set('n', '<leader>a','<cmd>:lua require("grapple").tag()<cr>', {desc = 'Grapple Tag File'})
vim.keymap.set('n', '<leader>d','<cmd>:lua require("grapple").untag()<cr>', {desc = 'UnGrapple Tag File'})
vim.keymap.set('n', '<leader>t','<cmd>:lua require("grapple").toggle_tags()<cr>', {desc = 'Toggle Grapple File'})

vim.keymap.set('n', '<leader>w','<cmd>:lua require("grapple").cycle_forward()<cr>', {desc = 'Grapple Cycle Forward'})
vim.keymap.set('n', '<leader>q','<cmd>:lua require("grapple").cycle_backward()<cr>', {desc = 'Grapple Cycle Backward'})
