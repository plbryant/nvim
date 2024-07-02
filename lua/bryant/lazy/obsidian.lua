return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	opts = {
		completion = { nvim_cmp = true, min_chars = 2 },
		dir = '/home/bryant/Documents/github/notes',
		disable_frontmatter = true,
		new_notes_location = 'current_dir',
		daily_notes = { folder = 'Daily' },
		ui = { enable = true },
		templates = {
			subdir = 'Obsidian/Templates',
		},
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			['<leader>oc'] = {
				action = function()
					return require('obsidian').util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			['<CR>'] = {
				action = function()
					return require('obsidian').util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		attachments = {
			img_folder = 'Obsidian/Meta',
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format('![%s](%s)', path.name, path)
			end,
		},
		image_name_func = function()
			return string.format('%s-', os.time())
		end,
	},
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
