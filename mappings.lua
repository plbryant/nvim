---@type MappingsTable
local M = {}

M.disabled = {
  -- for tmux navitagor to work
  n = {
    ['<C-h>'] = '',
    ['<C-l>'] = '',
    ['<C-j>'] = '',
    ['<C-k>'] = '',
  },
}

M.general = {
  n = {
    -- general
    ['<leader>q'] = { '<cmd> qa! <CR>', '󰗼 Exit' },

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
    ['<leader>e'] = {
      '<cmd> Oil <CR>',
      'Open oil menu',
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ['<leader>rcu'] = {
      function()
        require('crates').upgrade_all_crates()
      end,
      'update crates',
    },
  },
}

M.lspsaga = {
  n = {
    ['<leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      'LSP code action',
    },
    ['gf'] = {
      '<CMD>Lspsaga finder<CR>',
      ' Lspsaga show references and implementations',
    },
    ['gd'] = {
      '<CMD>Lspsaga goto_definition<CR>',
      ' Lspsaga go to definition',
    },
    ['<leader>lp'] = {
      '<CMD>Lspsaga peek_definition<CR>',
      ' Lspsaga peek definition',
    },
    ['<leader>K'] = {
      '<CMD>Lspsaga hover_doc<CR>',
      '󱙼 Lspsaga hover lsp',
    },
    ['<leader>o'] = { '<CMD>Lspsaga outline<CR>', ' Lspsaga show outline' },
    --  LSP
    ['Gr'] = { '<CMD>Telescope lsp_references<CR>', ' Lsp references' },
    ['[d'] = {
      '<CMD>Lspsaga diagnostic_jump_prev<CR>',
      ' Lspsaga prev diagnostics',
    },
    [']d'] = {
      '<CMD>Lspsaga diagnostic_jump_next<CR>',
      ' Lspsaga next Diagnostic',
    },
    ['<leader>fx'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      '󰁨 Lsp Quickfix',
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
