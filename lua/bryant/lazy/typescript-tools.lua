return {
	'pmizio/typescript-tools.nvim',
	opts = {
		on_attach = on_attach,
		complete_function_calls = true,
		expose_as_code_action = 'all',
	},
	ft = {
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
	},
	config = function(_, opts)
		require('typescript-tools').setup(opts)
	end,
}
