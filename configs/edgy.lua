local present, edgy = pcall(require, 'edgy')

if not present then
	return
end

local options = {
	fix_win_height = vim.fn.has('nvim-0.10.0') == 0,
	bottom = {
		{ ft = 'qf', title = 'QuickFix' },
		{ ft = 'dapui_watches', title = 'Watches' },
		{ ft = 'dapui_console', title = 'Debug Console' },
		'Trouble',
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
		{ ft = 'dapui_scopes', title = 'Scopes' },
		{ ft = 'dapui_breakpoints', title = 'Breakpoints' },
		{ ft = 'dapui_stacks', title = 'Stacks' },
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
		'dapui_scopes',
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
