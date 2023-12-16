---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require('custom.highlights')

M.ui = {
	theme_toggle = { 'vscode_dark', 'vscode_dark' },
	theme = 'vscode_dark',
	transparency = true,

	cmp = {
		icons = true,
		lspkind_text = true,
		style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
		disabled = false,
		selected_item_bg = 'simple', -- colored / simple
	},

	tabufline = {
		show_numbers = false,
		enabled = false,
		lazyload = false,
		overriden_modules = nil,
	},

	extended_integrations = {
		'todo',
		'trouble',
	},

	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.plugins = 'custom.plugins'

-- check core.mappings for table structure
M.mappings = require('custom.mappings')

return M