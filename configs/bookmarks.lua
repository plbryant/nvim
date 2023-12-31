local present, bookmarks = pcall(require, 'bookmarks')

if not present then
	return
end

local options = {
	-- storage_dir = '', -- NOTE: Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path"

	mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
	keymap = {
		toggle = '<leader><leader>', -- Toggle bookmarks(global keymap)
		add = '\\z', -- Add bookmarks(global keymap)
		jump = '<CR>', -- Jump from bookmarks(buf keymap)
		delete = 'dd', -- Delete bookmarks(buf keymap)
		order = '<space>b', -- Order bookmarks by frequency or updated_time(buf keymap)
		delete_on_virt = '\\dd', -- Delete bookmark at virt text line(global keymap)
		show_desc = '\\sd', -- show bookmark desc(global keymap)
	},
	width = 0.8, -- Bookmarks window width:  (0, 1]
	height = 0.7, -- Bookmarks window height: (0, 1]
	preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
	tags_ratio = 0.1, -- Bookmarks tags window ratio
	fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

	virt_text = '', -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
	sign_icon = '󰃃', -- if it is not empty, show icon in signColumn.
	virt_pattern = {
		'*.go',
		'*.lua',
		'*.sh',
		'*.php',
		'*.rs',
	}, -- Show virt text only on matched pattern
	border_style = 'single', -- border style: "single", "double", "rounded"
	hl = {
		border = 'TelescopeBorder', -- border highlight
		cursorline = 'guibg=Gray guifg=White', -- cursorline highlight
	},
}

require('bookmarks').setup(options)
