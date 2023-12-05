local present, conform = pcall(require, 'conform')

if not present then
	return
end

local options = {
	formatters_by_ft = {
		lua = { 'stylua' },
		javascript = { 'prettierd' },
		javascriptreact = { 'prettierd' },
		typescript = { 'prettierd' },
		typescriptreact = { 'prettierd' },
		css = { 'prettierd' },
		html = { 'prettierd' },
		json = { 'prettierd' },
		python = { 'blue', 'isort' },
		jsonc = { 'prettierd' },
		go = { 'goimports', 'gofumpt', 'golines' },
		sh = { 'shfmt' },
		['scss'] = { 'prettier' },
		['less'] = { 'prettier' },
		['yaml'] = { 'prettier' },
		['markdown'] = { 'prettier' },
		['markdown.mdx'] = { 'prettier' },
		['rust'] = { 'rustfmt' },
		['vue'] = { 'prettier' },
		['graphql'] = { 'prettier' },
		['handlebars'] = { 'prettier' },
	},
}

conform.setup(options)
