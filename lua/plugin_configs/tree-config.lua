local api = require("nvim-tree.api")

--Global settings recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--Setup
local setup_table = {
    view = { width = 40 },
    sort_by = "modification_time",
    renderer = { special_files = { "" } },
    git = { ignore = false }
}
require("nvim-tree").setup( setup_table )


--Focus window or close it if focused 
local function handle_tree_window()
    if (api.tree.is_tree_buf(0))  then
	api.tree.close()
    else
	api.tree.open({find_file = true, update_root = true})
    end
end

--Keymappings
vim.keymap.set('n', '<c-n>', handle_tree_window)
