local overrides = require('custom.configs.overrides')
local leet_arg = 'leetcode.nvim'

local VeryLazy = 'VeryLazy'
local plugins = {

  -- override default configurations

  {
    'williamboman/mason.nvim',
    opts = overrides.mason,
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = overrides.colorizer,
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = overrides.nvimtree,
    enabled = false,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = 'folke/neodev.nvim', -- better lua documentation
    config = function()
      require('plugins.configs.lspconfig')
      require('custom.configs.lspconfig')
    end,
  },

  {
    'stevearc/conform.nvim', -- formatter
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function()
      require('custom.configs.conform')
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    opts = overrides.cmp,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-buffer',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-emoji',
      'windwp/nvim-autopairs',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'kevinhwang91/promise-async',
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'kevinhwang91/nvim-ufo',
        config = function()
          require('custom.configs.ufo')
        end,
      },
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
          require('Comment').setup({
            pre_hook = require(
              'ts_context_commentstring.integrations.comment_nvim'
            ).create_pre_hook(),
          })
        end,
      },
    },
    opts = overrides.treesitter,
  },

  {
    'nvim-telescope/telescope.nvim',
    opts = overrides.telescope,
    dependencies = {
      'plbryant/git-worktree.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
  },

  -- startup

  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  -- lazy

  {
    'hinell/lsp-timeout.nvim',
    config = function()
      vim.g['lsp-timeout-config'] = {
        -- When focus is lost
        -- wait 5 minutes before stopping all LSP servers
        stopTimeout = 1000 * 60 * 5,
        startTimeout = 1000 * 10,
        silent = true,
      }
    end,
  },

  {
    'ThePrimeagen/harpoon',
    config = function()
      require('custom.configs.harpoon')
    end,
  },

  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    lazy = leet_arg ~= vim.fn.argv()[1],
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',
      'nvim-treesitter/nvim-treesitter',
      'rcarriga/nvim-notify',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- configuration goes here
      arg = leet_arg,
      lang = 'javascript',
    },
  },

  -- keys
  {
    'vim-scripts/ReplaceWithRegister',
    keys = { 'gr', 'grr' },
  },

  {
    'crusj/bookmarks.nvim',
    keys = {
      {
        '<tab><tab>',
        mode = { 'n' },
        desc = 'Toogle bookmarks',
      },
      { '\\z', mode = { 'n' }, desc = 'Add bookmark' },
      { '\\dd', mode = { 'n' }, desc = 'Delete bookmark' },
      { '\\sd', mode = { 'n' }, desc = 'Show bookmark' },
    },
    branch = 'main',
    config = function()
      require('bookmarks').setup()
      require('telescope').load_extension('bookmarks')
    end,
  },

  -- file type
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && yarn install',
  },

  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = 'neovim/nvim-lspconfig',
    opts = function()
      return require('custom.configs.rust-tools')
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end,
  },

  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = 'crates' } },
      })
      crates.show()
      require('core.utils').load_mappings('crates')
    end,
  },

  {
    'ray-x/go.nvim',
    ft = { 'go', 'gomod', 'gosum', 'gowork' },
    dependencies = {
      {
        'ray-x/guihua.lua',
        build = 'cd lua/fzy && make',
      },
    },
    config = function()
      require('custom.configs.go')
    end,
    build = ':lua require("go.install").update_all_sync()',
  },

  {
    'pmizio/typescript-tools.nvim', -- lsp intermediate tsc
    config = function()
      require('custom.configs.tsserver')
    end,
    ft = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
    },
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    config = function()
      require('custom.configs.obsidian')
    end,
  },

  -- very lazy

  {
    'tpope/vim-repeat',
    event = VeryLazy,
  },

  {
    'stevearc/dressing.nvim',
    event = VeryLazy,
  },

  {
    'gbprod/cutlass.nvim',
    event = VeryLazy,
    opts = {
      cut_key = 'x',
    },
  },

  -- event

  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = true,
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'LspAttach',
    config = function()
      require('nvim-surround').setup({})
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = 'BufWritePre',
    config = function()
      require('custom.configs.linter')
    end,
  },

  {
    'kevinhwang91/nvim-fundo', -- forever undo nvim
    event = 'BufReadPost',
    build = function()
      require('fundo').install()
    end,
  },

  {
    'utilyre/sentiment.nvim', -- highlight brackets
    event = 'LspAttach',
    init = function()
      vim.g.loaded_matchparen = 1
    end,
  },

  {
    'ray-x/lsp_signature.nvim', -- highlight parameters when type a function
    event = 'BufReadPost',
    config = function()
      require('custom.configs.signature')
    end,
  },

  {
    'tzachar/local-highlight.nvim', -- highlight same words under cursor
    cmd = 'LocalHighlightToggle',
    opts = {
      hlgroup = 'LocalHighlight',
    },
  },

  {
    'folke/todo-comments.nvim',
    event = 'BufWinEnter',
    config = function()
      require('custom.configs.todo-comments')
    end,
  },

  {
    'folke/edgy.nvim',
    event = 'BufReadPost',
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = 'screen'
    end,
    config = function()
      require('custom.configs.edgy')
    end,
  },

  -- cmd

  {
    'tpope/vim-fugitive', -- git in nvim
    cmd = 'G',
  },

  {
    'preservim/tagbar',
    cmd = 'TagbarToogle',
  },

  {
    'famiu/bufdelete.nvim', -- better buff delete
    cmd = { 'Bdelete', 'Bwipeout' },
  },

  {
    'stevearc/oil.nvim',
    cmd = { 'Oil' },
    config = function()
      require('custom.configs.oil')
    end,
  },

  {
    'smoka7/hop.nvim',
    version = '*',
    cmd = {
      'HopAnywhere',
      'HopChar1',
      'HopChar2',
      'HopWordCurrentLine',
      'HopLineStart',
      'HopPattern',
      'HopWord',
    },
    config = function()
      require('custom.configs.hop')
    end,
  },

  {
    'ThePrimeagen/refactoring.nvim',
    cmd = 'Refactor',
    config = function()
      require('custom.configs.refactoring')
    end,
  },

  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = function()
      require('custom.configs.zenmode')
    end,
  },

  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
    init = function()
      vim.g.code_action_menu_show_details = true
      vim.g.code_action_menu_show_diff = true
      vim.g.code_action_menu_show_action_kind = true
    end,
  },

  {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
    config = function()
      require('custom.configs.trouble')
    end,
  },

  {
    'nvim-neotest/neotest',
    cmd = 'Neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'thenbe/neotest-playwright',
    },
    config = function()
      require('custom.configs.neotest')
    end,
  },

  {
    'dmmulroy/tsc.nvim', -- check typescript definitions
    cmd = { 'TSC' },
    opts = {
      auto_open_qflist = true,
      spinner = {
        '⠋',
        '⠙',
        '⠹',
        '⠸',
        '⠼',
        '⠴',
        '⠦',
        '⠧',
        '⠇',
        '⠏',
      },
    },
  },

  {
    'folke/twilight.nvim', -- focus on code (not zen mode)
    cmd = 'Twilight',
    config = function()
      require('custom.configs.twilight')
    end,
  },

  {
    'smoka7/multicursors.nvim',
    dependencies = { 'smoka7/hydra.nvim' },
    opts = { hint_config = false },
    cmd = {
      'MCstart',
      'MCvisual',
      'MCclear',
      'MCpattern',
      'MCvisualPattern',
      'MCunderCursor',
    },
    keys = {
      {
        mode = { 'v', 'n' },
        '<C-n>',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
    },
  },

  -- debug

  {
    'mfussenegger/nvim-dap',
    cmd = {
      'DapContinue',
      'DapStepOver',
      'DapStepInto',
      'DapStepOut',
      'DapToggleBreakpoint',
    },
    dependencies = {
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require('custom.configs.virtual-text')
        end,
      },
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require('custom.configs.dap-ui')
        end,
      },
    },
    config = function()
      require('custom.configs.dap')
    end,
  },

  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    config = function()
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
    end,
  },

  -- optional

  {
    'folke/which-key.nvim',
    enabled = false,
  },

  {
    'rest-nvim/rest.nvim',
    ft = { 'http' },
    config = function()
      require('custom.configs.rest')
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    lazy = false,
    enabled = false,
    opts = function()
      return require('custom.configs.copilot')
    end,
    config = function(_, opts)
      require('copilot').setup(opts)
    end,
  },
}

return plugins
