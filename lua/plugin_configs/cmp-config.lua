local cmp = require'cmp'
--We need a snipping engine for autocompletion
local snip = require("luasnip")

vim.opt.completeopt = {"menu","menuone","noselect"}

cmp.setup({
    completion = {
	autocomplete = false
    },
    snippet = {
	-- snipped engine required
	expand = function(args)
	    snip.lsp_expand(args.body) -- For `luasnip` users.
	end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
	['<Tab>'] = cmp.mapping.select_next_item(),
	  --['<C-j>'] = cmp.mapping.scroll_docs(-4),
	  --['<C-k>'] = cmp.mapping.scroll_docs(4),
	--Jump to next parameter with snippet engine
	['<C-l>'] = cmp.mapping(function(fallback)
	    if snip.jumpable(1) then
		snip.jump(1)
	    else
		fallback()
	    end
	end
	),
	--Jump to previous parameter with snippet engine
	['<C-h>'] = cmp.mapping(function(fallback)
	    if snip.jumpable(-1) then
		snip.jump(-1)
	    else
		fallback()
	    end
	end
	),
	--Start completion
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'luasnip' },
    }, {
	{ name = 'buffer' },
    })
})
