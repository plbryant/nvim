-- tsserver
require('typescript-tools').setup({
	on_attach = on_attach,
	settings = {
		-- tsserver_path = '/home/bryant/.nvm/versions/node/v18.16.0/bin/typescript-language-server',
		separate_diagnostic_server = true,
		expose_as_code_action = {
			'fix_all',
			'add_missing_imports',
			'remove_unused',
		},
		tsserver_plugins = {
			'@styled/typescript-styled-plugin',
		},
	},
})
