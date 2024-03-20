return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				return 'make install_jsregexp'
			end)(),
		},
		{
			'windwp/nvim-autopairs',
			opts = {
				fast_wrap = {},
				disable_filetype = { 'TelescopePrompt', 'vim', 'spectre_panel' },
			},
			config = function(_, opts)
				require('nvim-autopairs').setup(opts)
				local cmp_autopairs = require('nvim-autopairs.completion.cmp')
				require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
			end,
		},
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
	},

	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		luasnip.config.setup({}) -- snipet engine

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = 'menu,menuone,noinsert' },
			mapping = cmp.mapping.preset.insert({
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete({}),
				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),
			}),
			sources = {
				{ name = 'nvim_lsp', max_item_count = 5 },
				{ name = 'luasnip', max_item_count = 5 },
				{ name = 'path', max_item_count = 5 },
			},
		})
	end,
}
