require("custom.options")
require("custom.keymaps")
require("config.lazy")

vim.api.nvim_set_hl(0, "GutterMarksGlobal", { fg = "#e79fc4", bold = true })
vim.api.nvim_set_hl(0, "GutterMarksLocal", { fg = "#dcd0ff" })
