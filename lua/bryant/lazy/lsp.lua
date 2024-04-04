return {
	'neovim/nvim-lspconfig',
	event = 'BufWinEnter',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
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
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				map('K', vim.lsp.buf.hover, 'Hover Documentation')
				vim.keymap.set('i', '<C-c>', function()
					vim.lsp.buf.signature_help()
				end, { desc = 'signature_help' })
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
						diagnostics = {
							globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
						},
					},
				},
			},
		}

		require('mason').setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- web dev
			'stylua',
			'prettierd',
			'prettier',
			'eslint_d',

			-- markdown
			'alex',
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
