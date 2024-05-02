return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	keys = {
		{ '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = 'Insert obsidian template' },
		{ '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Open in obsidian app' },
		{ '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Show obsidian backlinks' },
		{ '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'Show obsidian inks' },
		{ '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'Create new note' },
		{ '<leader>og', '<cmd>ObsidianTags<cr>', desc = 'Obsidian tags' },
		{ '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Obsidian Rename' },
		{ '<leader>otd', '<cmd>ObsidianToday<cr>', desc = 'Obsidian today' },
		{ '<leader>otm', '<cmd>ObsidianTomorrow<cr>', desc = 'Obsidian tomorrow' },
		{ '<leader>oy', '<cmd>ObsidianYesterday<cr>', desc = 'Obsidian yesterday' },
		{ '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Obsidian paste image' },
	},
	opts = {
		completion = { nvim_cmp = true, min_chars = 2 },
		dir = '/home/bryant/Documents/github/notes',
		disable_frontmatter = false,
		new_notes_location = 'current_dir',
		daily_notes = { folder = 'daily' },
		ui = { enable = true },
		templates = {
			subdir = 'templates',
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
			['<cr>'] = {
				action = function()
					return require('obsidian').util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		follow_url_func = function(url)
			vim.fn.jobstart({ 'xdg-open', url })
		end,
		note_id_func = function(title)
			local suffix = ''
			if title ~= nil then
				suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. '-' .. suffix
		end,
		note_path_func = function(spec)
			local path = spec.dir / tostring(spec.title)
			return path:with_suffix('.md')
		end,
		picker = {
			name = 'telescope.nvim',
			mappings = {
				new = '<C-x>',
				insert_link = '<C-l>',
			},
		},
		attachments = {
			img_folder = 'meta',
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
