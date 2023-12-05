---@type MappingsTable
local M = {}

M.disabled = {
  -- for tmux navitagor to work
  n = {
    ['<C-h>'] = '',
    ['<C-l>'] = '',
    ['<C-j>'] = '',
    ['<C-k>'] = '',
    ['<leader>b'] = '',
  },
}

M.general = {
  n = {
    -- general
    ['<leader>q'] = { '<cmd> qa! <CR>', '󰗼 Exit' },
    ['J'] = { 'mzJ`z', 'Better one line code' },
    ['<C-d'] = { '<C-d>zz', 'Better c-d' },
    ['<C-u'] = { '<C-u>zz', 'Better c-u' },
    ['n'] = { 'nzzzv', 'Better n' },
    ['N'] = { 'Nzzzv', 'Better N' },
    ['<C-n'] = {
      '[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]]',
      'Multicursor',
    },

    -- save file
    ['Z'] = { '<cmd> update <CR>', '󰗼 Save file' },
    ['<C-s'] = { '<cmd> update <CR>', '󰗼 Save file' },

    -- buffers
    ['<C-tab>'] = {
      '<cmd> b# <CR>',
      'Switch to last buffer',
    },
    ['<A-w>'] = {
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

    -- movement
    ['H'] = { '^', 'Go to the beginning of line' },
    ['L'] = { '$', 'Go to the end of line' },
  },

  v = {
    -- movement
    ['H'] = { '^', 'Go to the beginning of line' },
    ['L'] = { 'g_', 'Go to the end of line' },
    ['J'] = { ":m '>+1<CR>gv=gv", 'Move elements down' },
    ['K'] = { ":m '>+1<CR>gv=gv", 'Move elements top' },
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
        require('telescope.builtin').lsp_references()
      end,
      '  LSP references',
    },
    -- improve ui
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
    ['<leader>dt'] = {
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
    ['<leader>tw'] = {
      '<cmd> ZenMode <CR>',
      '🔦 ZenMode focus on code',
    },
  },
}

return M
