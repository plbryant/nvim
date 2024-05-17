return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = true,
	keys = {
		{
			'<leader>a',
			function()
				require('harpoon'):list():add()
			end,
			desc = 'harpoon file',
		},
		{
			'<M-e>',
			function()
				local harpoon = require('harpoon')
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = 'harpoon quick menu',
		},
		{
			'<M-h>',
			function()
				require('harpoon'):list():select(1)
			end,
			desc = 'harpoon to file 1',
		},
		{
			'<M-t>',
			function()
				require('harpoon'):list():select(2)
			end,
			desc = 'harpoon to file 2',
		},
		{
			'<M-n>',
			function()
				require('harpoon'):list():select(3)
			end,
			desc = 'harpoon to file 3',
		},
		{
			'<M-s>',
			function()
				require('harpoon'):list():select(4)
			end,
			desc = 'harpoon to file 4',
		},
		{
			'<leader><M-h>',
			function()
				require('harpoon'):list():replace_at(1)
			end,
			desc = 'harpoon replace file 1',
		},
		{
			'<leader><M-t>',
			function()
				require('harpoon'):list():replace_at(2)
			end,
			desc = 'harpoon replace file 2',
		},
		{
			'<leader><M-n>',
			function()
				require('harpoon'):list():replace_at(3)
			end,
			desc = 'harpoon replace file 3',
		},
		{
			'<leader><M-s>',
			function()
				require('harpoon'):list():replace_at(4)
			end,
			desc = 'harpoon replace file 4',
		},
	},
}
