local function setupLanguageServers()
	-- Setup language servers.

	-- Give capabilities (snipping) to LSP
	-- So that the server knows what we can do
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	vim.lsp.config('clangd', {
		-- Server-specific settings. See `:help lspconfig-setup`
		capabilities = capabilities,
		filetypes = { "c", "h" },
		cmd = {
			"clangd",
			"--background-index"
		}
		--windows: For clangd to work properly and find all header files,
		--we need to create config.yaml in clangd folder under Local
		--CompileFlags:
		--	Add:
		--  - --target=x86_64-w64-windows-gnu
	})
	vim.lsp.enable('clangd')

	vim.lsp.config('marksman', {
		-- Server-specific settings. See `:help lspconfig-setup`
		capabilities = capabilities,
	})
	vim.lsp.enable('marksman')

	vim.lsp.config('lua_ls', {
		capabilities = capabilities,
		filetypes = { "lua", "script" },
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
					enable = true
				},
				type = {
					weakUnionCheck = true,
					checkTableShape	= true
				},
				completion = {
					callSnippet = 'Replace'
				}
			}
		},
		on_init = function(client)
			local path = client.workspace_folders[1].name
			--luarc.json file can be provided in workspace
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					version = 'Lua5.4'
					--version = 'LuaJIT'
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						--"~/external_libs/pico8/library",
						"~/external_libs/love2d/library",
						"~/external_libs/lovr/library",
						-- Depending on the usage, you might want to add additional paths here.
					}
				}
			})
		end
	})
	vim.lsp.enable('lua_ls')


	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			--vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
			--vim.api.nvim_set_keymap('i', '<C-space>', '<C-x><C-o>', { noremap = true })

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
			--vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<F2>', vim.lsp.buf.format, opts)
			--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			--vim.keymap.set('n', '<space>wl', function()
			-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			--end, opts)
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, opts)
			--vim.keymap.set('n', '<space>f', function()
			--vim.lsp.buf.format { async = true }
			--end, opts)
		end,
	})
end

return { --LSP
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		dependencies = {
			'hrsh7th/nvim-cmp',
		},
		config = setupLanguageServers,
		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		keys = {
			{ 'go', vim.diagnostic.open_float },
			{ 'gO', vim.diagnostic.setqflist },
			{ 'gp', vim.diagnostic.goto_prev },
			{ 'gn', vim.diagnostic.goto_next }
		}
	}
}
