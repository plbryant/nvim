local present, edgy = pcall(require, 'edgy')

if not present then
	return
end

local options = {
	fix_win_height = vim.fn.has('nvim-0.10.0') == 0,
	bottom = {
		'Trouble',
		{ ft = 'qf', title = 'QuickFix' },
		{
			ft = 'neotest-output-panel',
			title = ' Test Output',
			open = function()
				vim.cmd.vsplit()
				require('neotest').output_panel.toggle()
			end,
		},
	},
	left = {
		{
			ft = 'neotest-summary',
			title = '  Tests',
			open = function()
				require('neotest').summary.toggle()
			end,
		},
	},
	right = {
		{ ft = 'spectre_panel' },
		{
			ft = 'help',
			size = { width = 90 }, -- only show help buffers
			filter = function(buf)
				return vim.bo[buf].buftype == 'help'
			end,
		},
		'neotest-output-panel',
		'neotest-summary',
	},
	options = {
		left = { size = 70 },
		bottom = { size = 10 },
		right = { size = 60 },
		top = { size = 10 },
	},
	wo = {
		winbar = false,
		signcolumn = 'no',
	},
	animate = {
		enabled = false,
	},
}

edgy.setup(options)
