local cmp_opt = require('custom.configs.cmp')
local overrides = require('custom.configs.overrides')
local leet_arg = 'leetcode.nvim'

local VeryLazy = 'VeryLazy'
local plugins = {

	-- override default configurations

	{
		'williamboman/mason.nvim',
		opts = overrides.mason,
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.configs.lspconfig')
			require('custom.configs.lspconfig')
		end,
	},

	{
		'stevearc/conform.nvim', -- formatter
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		config = function()
			require('custom.configs.conform')
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		opts = cmp_opt.cmp,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
		},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'kevinhwang91/promise-async',
			{
				'kevinhwang91/nvim-ufo',
				config = function()
					require('custom.configs.ufo')
				end,
			},
		},
		opts = overrides.treesitter,
	},

	{
		'nvim-telescope/telescope.nvim',
		opts = overrides.telescope,
		dependencies = {
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},

	-- startup

	{
		'christoomey/vim-tmux-navigator',
		lazy = false,
	},

	{
		'mg979/vim-visual-multi',
		lazy = false,
	},

	-- lazy

	{
		'ThePrimeagen/harpoon',
		config = function()
			require('custom.configs.harpoon')
		end,
	},

	{
		'kawre/leetcode.nvim',
		build = ':TSUpdate html',
		lazy = leet_arg ~= vim.fn.argv()[1],
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim', -- required by telescope
			'MunifTanjim/nui.nvim',
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			-- configuration goes here
			arg = leet_arg,
			lang = 'javascript',
		},
	},

	-- keys
	{
		'vim-scripts/ReplaceWithRegister',
		keys = { 'gr' },
	},

	{
		'kylechui/nvim-surround',
		version = '*', -- Use for stability; omit to use `main` branch for the latest features
		keys = { 'ys', 'ds', 'cs', { 'S', mode = 'v' } },
		event = 'LspAttach',
		config = function()
			require('nvim-surround').setup({})
		end,
	},

	{
		'crusj/bookmarks.nvim',
		keys = {
			{
				'<leader><leader>',
				mode = { 'n' },
				desc = 'Toogle bookmarks',
			},
			{ '\\z', mode = { 'n' }, desc = 'Add bookmark' },
			{ '\\dd', mode = { 'n' }, desc = 'Delete bookmark' },
			{ '\\sd', mode = { 'n' }, desc = 'Show bookmark' },
		},
		branch = 'main',
		config = function()
			require('custom.configs.bookmarks')
		end,
	},

	-- file type

	{
		'simrat39/rust-tools.nvim',
		ft = 'rust',
		dependencies = 'neovim/nvim-lspconfig',
		opts = function()
			return require('custom.configs.rust-tools')
		end,
		config = function(_, opts)
			require('rust-tools').setup(opts)
		end,
	},

	{
		'ray-x/go.nvim',
		ft = { 'go', 'gomod', 'gosum', 'gowork' },
		dependencies = {
			{ 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
		},
		config = function()
			require('custom.configs.go')
		end,
		build = ':lua require("go.install").update_all_sync()',
	},

	{
		'pmizio/typescript-tools.nvim', -- lsp intermediate tsc
		config = function()
			require('custom.configs.tsserver')
		end,
		ft = {
			'javascript',
			'typescript',
			'javascriptreact',
			'typescriptreact',
		},
	},

	{
		'epwalsh/obsidian.nvim',
		version = '*',
		ft = 'markdown',
		config = function()
			require('custom.configs.obsidian')
		end,
	},

	-- very lazy

	{
		'tpope/vim-repeat',
		event = VeryLazy,
	},

	{
		'stevearc/dressing.nvim',
		event = VeryLazy,
	},

	{
		'gbprod/cutlass.nvim',
		event = VeryLazy,
		opts = {
			cut_key = 'x',
		},
	},

	-- event

	{
		'kevinhwang91/nvim-fundo',
		event = 'BufReadPost',
		opts = {},
		build = function()
			require('fundo').install()
		end,
	},

	{
		'mfussenegger/nvim-lint',
		event = 'BufWritePre',
		config = function()
			require('custom.configs.linter')
		end,
	},

	{
		'folke/todo-comments.nvim',
		event = 'BufWinEnter',
		config = function()
			require('custom.configs.todo-comments')
		end,
	},

	-- cmd

	{
		'sindrets/diffview.nvim',
		cmd = 'DiffviewOpen',
		config = function()
			require('diffview').setup({
				view = {
					merge_tool = {
						layout = 'diff3_mixed',
						disable_diagnostics = true,
					},
				},
			})
		end,
	},

	{
		'folke/zen-mode.nvim',
		cmd = 'ZenMode',
		config = function()
			require('custom.configs.zenmode')
		end,
	},

	{
		'stevearc/oil.nvim',
		cmd = { 'Oil' },
		config = function()
			require('custom.configs.oil')
		end,
	},

	{
		'folke/trouble.nvim',
		cmd = 'TroubleToggle',
		config = function()
			require('custom.configs.trouble')
		end,
	},

	{
		'smoka7/hop.nvim',
		version = '*',
		cmd = {
			'HopAnywhere',
			'HopChar1',
			'HopChar2',
			'HopWordCurrentLine',
			'HopLineStart',
			'HopPattern',
			'HopWord',
		},
		config = function()
			require('custom.configs.hop')
		end,
	},

	-- optional

	{
		'lukas-reineke/indent-blankline.nvim',
		enabled = false,
	},

	{
		'folke/which-key.nvim',
		enabled = false,
	},

	{
		'nvim-tree/nvim-tree.lua',
		enabled = false,
	},

	{
		'max397574/better-escape.nvim',
		event = 'InsertEnter',
		enabled = false,
	},

	{
		'ThePrimeagen/refactoring.nvim',
		enabled = false,
		cmd = 'Refactor',
		config = function()
			require('custom.configs.refactoring')
		end,
	},

	{
		'NvChad/nvim-colorizer.lua',
		enabled = true,
		opts = overrides.colorizer,
	},

	{
		'zbirenbaum/copilot.lua',
		lazy = false,
		enabled = false,
		opts = function()
			return require('custom.configs.copilot')
		end,
		config = function(_, opts)
			require('copilot').setup(opts)
		end,
	},

	{
		'folke/edgy.nvim',
		enabled = false,
		event = 'BufReadPost',
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = 'screen'
		end,
		config = function()
			require('custom.configs.edgy')
		end,
	},

	{
		'nvim-neotest/neotest',
		enabled = false,
		cmd = 'Neotest',
		dependencies = {
			'haydenmeade/neotest-jest',
			'thenbe/neotest-playwright',
		},
		config = function()
			require('custom.configs.neotest')
		end,
	},
}

return plugins
