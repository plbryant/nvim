return {
	'neovim/nvim-lspconfig',
	event = 'BufEnter',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'williamboman/mason.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		{ 'https://github.com/folke/neodev.nvim', opts = {} },
		{ 'j-hui/fidget.nvim', opts = {} },
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local servers = {
			cssls = {},
			html = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = 'Replace',
						},
					},
				},
			},
		}

		require('mason').setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua',
			'prettierd',
			'prettier',
			'eslint_d',
			'luacheck',
		})
		require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

		require('mason-lspconfig').setup({
			ensure_installed = ensure_installed,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end,
			},
		})
	end,
}
