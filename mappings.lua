---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		['<C-h>'] = '',
		['<C-l>'] = '',
		['<C-j>'] = '',
		['<C-k>'] = '',
		['<leader>b'] = '',
		['gr'] = '',
	},
}

M.general = {
	n = {
		-- general
		['<leader>q'] = { '<cmd> qa! <CR>', '󰗼 Exit' },

		-- buffers
		['<C-tab>'] = {
			'<cmd> b# <CR>',
			'Switch to last buffer',
		},

		['<C-w>'] = {
			'<cmd> Bdelete <CR>',
			'Close current buffer',
		},

		-- transparency
		['<leader>TT'] = {
			function()
				require('base46').toggle_transparency()
			end,
			'Toggle transparency',
		},
	},

	i = {
		-- buffers
		['<C-tab>'] = {
			'<cmd> b# <CR>',
			'Switch to last buffer',
		},
		['<C-w>'] = {
			'<cmd> Bdelete <CR>',
			'Close current buffer',
		},
	},
}

M.spell = {
	n = {
		['<leader>ss'] = {
			'<cmd> Telescope spell_suggest <CR>',
			' Spell list suggest',
		},
		['<leader>ts'] = {
			'<cmd> set spell! <CR>',
			'󰓆 Toggle spell',
		},
		['zg'] = { 'zg', '󰓆 Spell Add word to dictionary' },
	},
}

M.trouble = {
	n = {
		['<leader>t'] = {
			'<cmd> TroubleToggle <Cr>',
			' Toggle trouble',
		},
	},
}

M.Telescope = {
	n = {
		['<leader>tt'] = {
			'<cmd> TodoTelescope <Cr>',
			' Open TODO telescope',
		},
		['<leader>tk'] = {
			'<cmd> Telescope keymaps <Cr>',
			' Open telescope keymaps',
		},
		['<leader>fl'] = {
			'<cmd> Telescope find_files <Cr>',
			'   Open telescope files',
		},
		['<tab>'] = {
			'<cmd> Telescope buffers <Cr>',
			'   Open telescope buffers',
		},
	},
}

M.harpoon = {
	n = {
		['<leader>sh'] = {
			'<CMD>Telescope harpoon marks<CR>',
			'󱡀 Harpoon Toggle quick menu',
		},
		['<leader>a'] = {
			function()
				require('harpoon.mark').add_file()
			end,
			'Harpoon add new harpoon',
		},
		['<leader>1'] = {
			function()
				require('harpoon.ui').nav_file(1)
			end,
			'Harpoon movHarpoon e to harpoon 1',
		},
		['<leader>2'] = {
			function()
				require('harpoon.ui').nav_file(2)
			end,
			'Harpoon move to harpoon 2',
		},
		['<leader>3'] = {
			function()
				require('harpoon.ui').nav_file(3)
			end,
			'Harpoon move to harpoon 3',
		},
		['<leader>4'] = {
			function()
				require('harpoon.ui').nav_file(4)
			end,
			'Harpoon move to harpoon 4',
		},
		['<leader>j'] = {
			function()
				require('harpoon.ui').nav_prev()
			end,
			'Harpoon move to harpoon next',
		},
		['<leader>k'] = {
			function()
				require('harpoon.ui').nav_next()
			end,
			'Harpoon move to harpoon before',
		},
	},
}

M.lsp = {
	n = {
		['gi'] = {
			function()
				require('telescipe.builtin').lsp_references()
			end,
			'  LSP references',
		},
		['<leader>fm'] = {
			function()
				require('conform').format()
			end,
			'format with conform',
		},
		['<leader>lf'] = {
			function()
				vim.diagnostic.open_float({ border = 'rounded' })
			end,
			'Floating diagnostic',
		},
	},
}

M.oil = {
	n = {
		['<leader>e'] = {
			'<cmd> Oil <CR>',
			'Open oil menu',
		},
	},
}

M.variety = {
	n = {
		['<leader>tz'] = {
			'<cmd> ZenMode <CR>',
			'🔦 ZenMode focus on code',
		},
	},
}

M.hop = {
	n = {
		['<leader>ha'] = {
			'<cmd> HopAnywhere <CR>',
			' Hope anywhere',
		},
		['s'] = { '<cmd> HopChar1 <CR>', ' Hope char 1' },
		['S'] = { '<cmd> HopChar2 <CR>', ' Hope char 2' },
		['<leader>hl'] = {
			'<cmd> HopWordCurrentLine <CR>',
			' Hop word current line',
		},
		['<leader>hs'] = { '<cmd> HopLineStart <CR>', ' Hope line start' },
		['<leader>/'] = { '<cmd> HopPattern <CR>', ' Hope pattern' },
		['<leader>hw'] = { '<cmd> HopWord <CR>', ' Hope word' },
	},
}

M.git = {
	n = {
		['<leader>gc'] = { '<CMD>Telescope git_commits<CR>', '  Git commits' },
		['<leader>gb'] = { '<CMD>Telescope git_branches<CR>', '  Git branches' },
		['<leader>gs'] = { '<CMD>Telescope git_status<CR>', '  Git status' },
		['<leader>gvd'] = { '<CMD> DiffviewOpen<CR>', ' Diffview show git diff' },
		['<leader>gvf'] = {
			'<CMD> DiffviewFileHistory %<CR>',
			' Diffview show file history',
		},
		['<leader>gvp'] = {
			'<CMD> DiffviewOpen --cached<CR>',
			' Diffview show staged diffs',
		},
		['<leader>gvr'] = { '<CMD> DiffviewRefresh<CR>', ' Diffview refresh' },
		['<leader>gvc'] = { '<CMD> DiffviewClose<CR>', ' Diffview close' },
	},
}
return M
