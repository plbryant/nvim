---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require('custom.highlights')

M.ui = {
	theme_toggle = { 'penumbra_light', 'penumbra_light' },
	theme = 'penumbra_light',
	transparency = false,

	cmp = {
		icons = false,
		lspkind_text = false,
		style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
		disabled = false,
		selected_item_bg = 'colored', -- colored / simple
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