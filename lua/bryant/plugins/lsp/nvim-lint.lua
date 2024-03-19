return {
	'mfussenegger/nvim-lint',
	event = 'BufWritePre',
	config = function()
		local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		lint.linters_by_ft = {
			lua = { 'luacheck' },
			yaml = { 'yamllint' },
			json = { 'jsonlint' },
			jsonc = { 'jsonlint' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
		}
	end,
}
