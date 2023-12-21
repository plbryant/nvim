local M = {}

M.treesitter = {
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
		'rust',

		-- golang
		'go',
		'gomod',
		'gowork',
		'gosum',

		-- Markdown
		'markdown',
		'markdown_inline',

		-- Web Dev
		'javascript',
		'typescript',
		'tsx',
		'html',
		'css',
	},
	indent = {
		enable = true,
	},
	playground = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {

		-- lsp's
		'emmet-language-server',
		'lua-language-server',
		'css-lsp',
		'html-lsp',
		'tailwindcss-language-server',
		'marksman',
		'json-lsp',
		'yaml-language-server',
		'pyright',

		-- formaters
		'stylua',
		'prettierd',
		'prettier',
		'blue',
		'isort',
		'gofumpt',
		'goimports',
		'golines',
		'gopls',
		'shfmt',

		-- linters
		'eslint_d',
		'jsonlint',
		'luacheck',
		'yamllint',
		'mypy',
		'ruff',
		'golangci-lint',
	},
}

M.telescope = {
	defaults = {
		preview = {
			filetype_hook = function(_, bufnr, opts)
				-- don't display jank pdf previews
				if opts.ft == 'pdf' then
					require('telescope.previewers.utils').set_preview_message(
						bufnr,
						opts.winid,
						'Not displaying ' .. opts.ft
					)
					return false
				end
				return true
			end,
		},
		vimgrep_arguments = {
			'rg',
			'-L',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'-uu',
		},
		file_ignore_patterns = {
			'node_modules',
			'.docker',
			'.git',
			'yarn.lock',
			'tags',
			'go.sum',
			'go.mod',
			'tags',
			'mocks',
			'refactoring',
		},
		layout_config = {
			horizontal = {
				prompt_position = 'bottom',
			},
		},
	},

	extensions_list = {
		'themes',
		'terms',
		'fzf',
	},

	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
}

M.colorizer = {
	filetypes = {
		'*',
		cmp_docs = { always_update = true },
		cmp_menu = { always_update = true },
	},
	user_default_options = {
		names = false,
		RRGGBBAA = true,
		rgb_fn = true,
		tailwind = true,
		RGB = true,
		RRGGBB = true,
		AARRGGBB = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
		sass = { enable = true, parsers = { 'css' } },
		mode = 'background', -- Available methods are false / true / "normal" / "lsp" / "both"
		virtualtext = '■',
		always_update = true,
	},
}

return M