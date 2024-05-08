return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	build = ':TSUpdate',
	opts = {
		ensure_installed = {
			'vim',
			'lua',
			'bash',
			'json',
			'json5',
			'jq',
			'yaml',
			'regex',
			'toml',
			'vimdoc',
			'dockerfile',
			'graphql',
			'hurl',
			'git_config',
			'gitignore',
			'http',
			'fish',
			'markdown',
			'markdown_inline',
			'javascript',
			'typescript',
			'tsx',
			'html',
			'css',
			'rust',
			'c',
			'terraform',
			-- golang
			'go',
			'gosum',
			'gomod',
			'gotmpl',
			'gowork',
		},
		auto_install = true,
		indent = { enable = true },
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		playground = { enable = false },
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}
