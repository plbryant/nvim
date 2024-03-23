return {
	'stevearc/conform.nvim',
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			css = { 'prettierd' },
			html = { 'prettierd' },
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			['scss'] = { 'prettier' },
			['less'] = { 'prettier' },
			['markdown'] = { 'prettier' },
			['markdown.mdx'] = { 'prettier' },
			['graphql'] = { 'prettier' },
		},
	},
	keys = {
		{
			'<leader>um',
			function()
				require('conform').format()
			end,
			desc = 'Format document with conform',
		},
	},
}
