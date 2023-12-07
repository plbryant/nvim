-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
	-- general
	Visual = { bg = '#fccc7e', fg = '#000000' },
	Comment = { italic = true },
	MatchWord = { bg = 'none' },
	MatchParen = { bg = 'none' },

	-- tresitter
	['@punctuation.bracket'] = { bg = 'none' },

	-- search
	IncSearch = { fg = '#000000', bg = '#fccc7e' },
	Search = { fg = '#000000', bg = '#fccc7e' },

	-- cursor
	Cursor = { bg = '#fcd28f', fg = '#000000' },
	CursorLine = { bg = '#fceac7' },

	-- spell
	SpellBad = { fg = '#fca10f', strikethrough = true, undercurl = false },
	SpellCap = { fg = '#fca10f', strikethrough = true, undercurl = false },
	SpellRare = { fg = '#fca10f', strikethrough = true, undercurl = false },
}

---@type HLTable
M.add = {
	-- gitsigns
	GitSignsChange = { fg = '#fcdb05' },
	GitSignsAdd = { fg = '#05fca9' },
	GitSignsDelete = { fg = '#f70909' },
	GitSignsText = { fg = '#ffffff', bg = '#f70909', bold = true },

	MultiCursor = { bg = '#02cad8', fg = '#000000' },
	MultiCursorMain = { bg = '#02cad8', fg = '#000000' },
}

return M
