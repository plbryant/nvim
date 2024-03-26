return {
	'neovim/nvim-lspconfig',
	event = 'BufEnter',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		{ 'j-hui/fidget.nvim', opts = {} },
		{ 'folke/neodev.nvim', opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('bryant-lsp-attach', { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				end

				map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
				map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
				map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				map('K', vim.lsp.buf.hover, 'Hover Documentation')
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
		local servers = {
			cssls = {},
			html = {},
			lua_ls = {
				settings = {
					Lua = {
						globals = { 'vim', 'require' },
					},
				},
			},
		}

		require('mason').setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua', -- Used to format Lua code
			'prettierd',
			'prettier',
			'eslint_d',
			'luacheck',
		})
		require('mason-tool-installer').setup({
			ensure_installed = ensure_installed,
		})

		require('mason-lspconfig').setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
