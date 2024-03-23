return {
	'nvim-treesitter/nvim-treesitter',
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
		},
		auto_install = true,
		indent = { enable = true },
		autotag = { enable = true },
		highlight = { enable = true },
		playground = { enable = true },
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}