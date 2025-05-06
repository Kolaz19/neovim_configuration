return {
	'L3MON4D3/LuaSnip',
	lazy = true,
	config = function()
		require("luasnip").setup {
			snip_env = {
				--Define shortcuts for snippet files here
				--Otherwise we would have to define them in every snippet file
				--LuaSnip does use them automatically
				ls = require("luasnip"),
				s = require("luasnip").snippet,
				sn = require("luasnip").snippet_node,
				isn = require("luasnip").indent_snippet_node,
				t = require("luasnip").text_node,
				i = require("luasnip").insert_node,
				f = require("luasnip").function_node,
				c = require("luasnip").choice_node,
				d = require("luasnip").dynamic_node,
				r = require("luasnip").restore_node,
				events = require("luasnip.util.events"),
				ai = require("luasnip.nodes.absolute_indexer"),
				extras = require("luasnip.extras"),
				l = require("luasnip.extras").lambda,
				rep = require("luasnip.extras").rep,
				p = require("luasnip.extras").partial,
				m = require("luasnip.extras").match,
				n = require("luasnip.extras").nonempty,
				dl = require("luasnip.extras").dynamic_lambda,
				fmt = require("luasnip.extras.fmt").fmt,
				fmta = require("luasnip.extras.fmt").fmta,
				conds = require("luasnip.extras.expand_conditions"),
				postfix = require("luasnip.extras.postfix").postfix,
				types = require("luasnip.util.types"),
				parse = require("luasnip.util.parser").parse_snippet,
				ms = require("luasnip").multi_snippet,
				k = require("luasnip.nodes.key_indexer").new_key
			}
		}
		--Load all snippets
		local configDir = vim.fn.stdpath('config')
		require("luasnip.loaders.from_lua").load({ paths = configDir .. "/lua/plugins/snippets" })

		vim.api.nvim_create_user_command('Snip', require("luasnip.loaders").edit_snippet_files, { nargs = 0 })
	end
}
