local present, lspsaga = pcall(require, 'lspsaga')

if not present then
	return
end

lspsaga.setup({
	lightbulb = {
		enable = false,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	outline = {
		win_position = 'right',
		win_with = '',
		win_width = 50,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = 'o',
			expand_collapse = 'u',
			quit = 'q',
		},
	},
	symbol_in_winbar = {
		enable = true,
		separator = ' ',
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
	ui = {
		theme = 'round',
		title = false,
		border = 'rounded',
		winblend = 0,
		expand = '',
		collapse = '',
		preview = ' ',
		code_action = '',
		diagnostic = '',
		incoming = ' ',
		outgoing = ' ',
	},
})
