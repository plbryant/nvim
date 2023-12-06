local M = {}

M.cmp = {

	completion = {
		completeopt = 'menu,menuone,noinsert,noselect',
	},

	mapping = {
		['<A-Space>'] = require('cmp').mapping.complete(),
		['<C-Space>'] = require('cmp').config.disable,
		['<CR>'] = require('cmp').config.disable,
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'nvim_lua' },
		{ name = 'path' },
	},
}

return M
