return {
	'neovim/nvim-lspconfig',
	event = 'BufEnter',
	  dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
    "j-hui/fidget.nvim",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local servers = {
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

    require('fidget').setup()
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				'emmet-language-server',
				'lua-language-server',
				'css-lsp',
				'html-lsp',
				'marksman',
				'json-lsp',
				'yaml-language-server',
				'tailwindcss-language-server',
				'dockerfile-language-server',

				'prettierd',
				'prettier',

				'eslint_d',
				'luacheck',
				'yamllint',
				'jsonlint',
			},
		})
	end,
}
