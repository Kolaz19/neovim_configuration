  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local snip = require("luasnip")

  vim.opt.completeopt = {"menu","menuone","noselect"}

  cmp.setup({
    completion = {
	autocomplete = false
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         snip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
      --['<C-j>'] = cmp.mapping.scroll_docs(-4),
      --['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-l>'] = cmp.mapping(function(fallback)
	if snip.jumpable(1) then
	    snip.jump(1)
	else
	    fallback()
	end
    end
    ),
    ['<C-h>'] = cmp.mapping(function(fallback)
	if snip.jumpable(-1) then
	    snip.jump(-1)
	else
	    fallback()
	end
    end
    ),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })
