---@type MappingsTable
local M = {}

M.disabled = {
  n = {

    -- diable for multicursors
    ['<C-n>'] = '',

    -- diable for replace register
    ['gr'] = '',

    -- diable for replace register
    ['<C-c>'] = '',

    -- disable for new find files map
    ['<leader>ff'] = '',

    -- disale default keybinds
    -- for tmux navitagor to work
    ['<C-h>'] = '',
    ['<C-l>'] = '',
    ['<C-j>'] = '',
    ['<C-k>'] = '',

    -- disale for hope plugin
    ['<leader>h'] = '',
  },
}

M.text = {
  i = {
    ['<C-s>'] = { '<cmd> w <CR>', 'Save file' },
    ['<C-Up>'] = { '<cmd> :m-2<CR>', ' Move up' },
    ['<C-Down>'] = { '<cmd> :m+<CR>', ' Move down' },
    ['<A-Left>'] = {
      '<ESC>I',
      ' Move to beginning of line',
    },
    ['<A-Right>'] = { '<ESC>A', ' Move to end of line' },
  },

  n = {
    ['<C-s>'] = { '<cmd> w <CR>', 'Save file' },
    ['<C-Up>'] = { '<cmd> :m-2<CR>', '󰜸 Move line up' },
    ['<C-Down>'] = {
      '<cmd> :m+<CR>',
      '󰜯 Move line down',
    },
  },

  v = {
    ['<C-Up>'] = {
      ":m'<-2<CR>gv=gv",
      '󰜸 Move selection up',
      opts = { silent = true },
    },
    ['<C-Down>'] = {
      ":m'>+1<CR>gv=gv",
      '󰜯 Move selection down',
      opts = { silent = true },
    },
    -- Indent backward/forward:
    ['<'] = {
      '<gv',
      'Ident backward',
      opts = { silent = false },
    },
    ['>'] = {
      '>gv',
      'Ident forward',
      opts = { silent = false },
    },
  },
}

M.general = {
  n = {
    -- general
    ['<leader>q'] = { '<cmd> qa! <CR>', '󰗼 Exit' },

    -- improve ui
    ['<leader>ca'] = {
      '<cmd> CodeActionMenu <CR>',
      'CodeActionMenu',
    },

    -- buffers
    ['<C-tab>'] = {
      '<cmd> b# <CR>',
      'Switch to last buffer',
    },
    ['<tab>'] = {
      '<cmd> bNext <CR>',
      'Switch to the next buffer',
    },
    ['<A-w>'] = {
      '<cmd> Bdelete <CR>',
      'Close current buffer',
    },
    ['<A-W>'] = {
      '<cmd> Bwipeout <CR>',
      'Force close current buffer',
    },

    -- telescope
    ['<leader>tH'] = {
      '<cmd> Telescope highlights <CR>',
      'Open telescope highlights',
    },

    -- transparency
    ['<leader>TT'] = {
      function()
        require('base46').toggle_transparency()
      end,
      'Toggle transparency',
    },

    -- movement
    ['H'] = { '^', 'Go to the beginning of line' },
    ['L'] = { '$', 'Go to the end of line' },
  },

  v = {
    -- movement
    ['H'] = { '^', 'Go to the beginning of line' },
    ['L'] = { '$', 'Go to the end of line' },
  },

  i = {
    -- buffers
    ['<C-tab>'] = {
      '<cmd> b# <CR>',
      'Switch to last buffer',
    },
    ['<A-w>'] = {
      '<cmd> Bdelete <CR>',
      'Close current buffer',
    },
    ['<A-W>'] = {
      '<cmd> Bwipeout <CR>',
      'Force close current buffer',
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
    ['<leader>ft'] = {
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
    ['<leader>ff'] = {
      '<cmd> Telescope buffers <Cr>',
      '   Open telescope buffers',
    },
  },
}

M.harpoon = {
  n = {
    ['<leader><leader>'] = {
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

M.nvimtree = {
  n = {
    ['<leader>e'] = {
      function()
        require('nvim-tree.api').tree.toggle(false, true)
      end,
      ' Toggle nvimtree',
    },
  },
}

M.treesitter = {
  n = {
    ['<leader>cu'] = {
      '<CMD>Inspect<CR>',
      ' Find highlight',
    },
  },
}

M.lsp = {
  n = {
    ['gi'] = {
      function()
        require('telescope.builtin').lsp_references()
      end,
      '  LSP references',
    },
    ['<leader>fm'] = {
      function()
        require('conform').format()
      end,
      ' 🖌️ SLP format with conform',
    },
    ['<leader>f'] = {
      function()
        vim.diagnostic.open_float({ border = 'rounded' })
      end,
      ' ❓LSP floating diagnostic',
    },
  },
}

M.dap = {
  n = {
    ['<leader>tt'] = {
      '<CMD>DapToggleBreakpoint<CR>',
      '  Dap Toggle breakpoint',
    },
    ['<leader>ta'] = {
      function()
        require('dap').clear_breakpoints()
      end,
      ' 🤙 Dap clear breakpoints',
    },
    ['<F5>'] = {
      '<CMD>DapContinue <CR>',
      ' Dap Continue',
    },
    ['<F10>'] = {
      '<CMD>DapStepOver <CR>',
      '  Dap Step over',
    },
    ['<F11>'] = {
      '<CMD>DapStepInto <CR>',
      ' Dap Step into',
    },
    ['<F9>'] = {
      '<CMD>DapStepOut <CR>',
      ' Dap Step out',
    },
  },
}

M.twilight = {
  n = {
    ['<leader>tw'] = {
      '<cmd> twilight <CR>',
      '🔦 Twilight focus on code',
    },
  },
}

M.worktree = {
  n = {
    ['<leader>wt'] = {
      function()
        require('telescope').extensions.git_worktree.git_worktrees()
      end,
      '🌳 Open worktree menu',
    },
    ['<leader>cwt'] = {
      function()
        require('telescope').extensions.git_worktree.create_git_worktree()
      end,
      '🌳 Create a worktree',
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
    ['<leader>fh'] = {
      '<cmd> HopWordCurrentLine <CR>',
      ' Hop word current line',
    },
    ['<leader>hl'] = { '<cmd> HopLineStart <CR>', ' Hope line start' },
    ['<leader>/'] = { '<cmd> HopPattern <CR>', ' Hope pattern' },
    ['<leader>hw'] = { '<cmd> HopWord <CR>', ' Hope word' },
  },
}

M.oil = {
  n = {
    ['-'] = {
      '<cmd> Oil <CR>',
      'Open oil menu',
    },
  },
}

return M
