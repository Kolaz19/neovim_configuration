local function getOptsTable()
	--local cmp = require'cmp'
	--We need a snipping engine for autocompletion
	--local snip = require("luasnip")

	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	return {
		--Enable this to not have automatic floating window
		--[[
		completion = {
			autocomplete = false
		},
		--]]
		snippet = {
			-- snipped engine required
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		completion = {
			--Min. chars to trigger autocomplete
			keyword_length = 3
		},
		-- Max amount of entries in popup
		--performance = {
		--	max_view_entries = 5
		--},
		mapping = require('cmp').mapping.preset.insert({
			['<S-Tab>'] = require('cmp').mapping.select_prev_item(),
			['<Tab>'] = require('cmp').mapping.select_next_item(),
			--['<C-j>'] = cmp.mapping.scroll_docs(-4),
			--['<C-k>'] = cmp.mapping.scroll_docs(4),
			--Jump to next parameter with snippet engine
			['<C-l>'] = require('cmp').mapping(function(fallback)
				if require("luasnip").jumpable(1) then
					require("luasnip").jump(1)
				else
					fallback()
				end
			end
			),
			--Jump to previous parameter with snippet engine
			['<C-h>'] = require('cmp').mapping(function(fallback)
				if require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				else
					fallback()
				end
			end
			),
			--Start completion
			['<C-Space>'] = require('cmp').mapping.complete(),
			['<C-e>'] = require('cmp').mapping.abort(),
			['<CR>'] = require('cmp').mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = require('cmp').config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		}, {
			{ name = 'buffer' },
		})
	}
end

return { --AUTOCOMPLETION
	{
		'hrsh7th/nvim-cmp',
		--We can't lazy load NVIM-CMP on it's own,
		--because we use it to update the capabilities
		--in our lspconfig-config
		lazy = true,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = getOptsTable
	}
}
