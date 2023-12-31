-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
	-- general
	Visual = { bg = '#2f2e3e', fg = 'white' },
	Comment = { italic = true },
	MatchWord = { bg = 'none' },
	MatchParen = { bg = 'none' },

	-- tresitter
	['@punctuation.bracket'] = { bg = 'none' },

	-- search
	IncSearch = { fg = 'black', bg = 'pink' },
	Search = { fg = 'black', bg = 'pink' },

	-- cursor
	Cursor = { bg = 'pink', fg = 'black' },
	CursorLine = { bg = '#2f2e3e' },

	-- spell
	SpellBad = { strikethrough = true, fg = 'red', undercurl = false },
	SpellCap = { strikethrough = true, fg = 'orange', undercurl = false },
	SpellRare = { strikethrough = true, fg = 'nord_blue', undercurl = false },
}
---@type HLTable
M.add = {
	-- gitsigns
	GitSignsChange = { fg = 'green' },
	GitSignsAdd = { fg = 'vibrant_green' },
	GitSignsDelete = { fg = 'red' },
	GitSignsText = { fg = 'white', bg = 'red', bold = true },

	-- multicursor
	MultiCursor = { bg = 'pink', fg = 'black2' },
	MultiCursorMain = { bg = 'pink', fg = 'black2' },
}

return M
