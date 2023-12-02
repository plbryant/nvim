local M = {}

M.treesitter = {
  ensure_installed = {
    'vim',
    'lua',
    'bash',
    'json',
    'json5',
    'jq',
    'yaml',
    'regex',
    'toml',
    'rust',

    -- golang
    'go',
    'gomod',
    'gowork',
    'gosum',

    -- Markdown
    'markdown',
    'markdown_inline',

    -- Web Dev
    'javascript',
    'typescript',
    'tsx',
    'html',
    'css',
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {

    -- lsp's
    'emmet-language-server',
    'lua-language-server',
    'css-lsp',
    'html-lsp',
    'tailwindcss-language-server',
    'marksman',
    'json-lsp',
    'yaml-language-server',
    'pyright',

    -- formaters
    'stylua',
    'prettierd',
    'prettier',
    'isort',
    'ruff',
    'blue',

    -- linters
    'eslint_d',
    'jsonlint',
    'luacheck',
    'yamllint',
    'mypy',

    -- debugger
    'js-debug-adapter',
    'debugpy',

    -- rust
    'rust_analizer',
    'codelldb',

    -- go
    'gofumpt',
    'goimports',
    'golines',
    'gomodifytags',
    'gopls',
    'golangci-lint',
  },
}

M.telescope = {
  defaults = {
    preview = {
      filetype_hook = function(_, bufnr, opts)
        -- don't display jank pdf previews
        if opts.ft == 'pdf' then
          require('telescope.previewers.utils').set_preview_message(
            bufnr,
            opts.winid,
            'Not displaying ' .. opts.ft
          )
          return false
        end
        return true
      end,
    },
    vimgrep_arguments = {
      'rg',
      '-L',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-uu',
    },
    file_ignore_patterns = {
      'node_modules',
      '.docker',
      '.git',
      'yarn.lock',
      'tags',
    },
    layout_config = {
      horizontal = {
        prompt_position = 'bottom',
      },
    },
  },

  extensions_list = {
    'themes',
    'terms',
    'fzf',
    'git_worktree',
  },

  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

M.cmp = {
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },

  mapping = {
    ['<A-Space>'] = require('cmp').mapping.complete(),
    ['<C-Space>'] = require('cmp').config.disable,
    ['<CR>'] = require('cmp').mapping.confirm({
      behavior = require('cmp').ConfirmBehavior.Insert,
    }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'spell' },
    { name = 'emoji' },
    { name = 'crates' },
  },
}

M.nvimtree = {
  filters = {
    dotfiles = false,
    custom = {
      '**/node_modules',
      '**/%.git',
      '**/%.github',
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    side = 'left',
    width = 45,
    cursorline = false,
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = false,
    },
  },
  renderer = {
    group_empty = true,
    indent_width = 4,
    highlight_opened_files = 'name',
    highlight_git = true,
    indent_markers = {
      enable = false,
      icons = {
        corner = '└ ',
        edge = '│ ',
        none = '  ',
      },
    },
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          deleted = '',
          ignored = '◌',
          renamed = '➜',
          staged = '',
          unmerged = '',
          unstaged = '',
          untracked = '',
        },
      },
    },
  },
  hijack_unnamed_buffer_when_opening = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  tab = {
    sync = {
      open = true,
      close = true,
    },
  },
  sort_by = 'name',
  diagnostics = {
    enable = false,
  },
}

M.colorizer = {
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = false, -- #RRGGBBAA hex codes
    AARRGGBB = false, -- 0xAARRGGBB hex codes
    rgb_fn = false, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = 'virtualtext', -- Set the display mode.
    -- Available methods are false / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = false, -- Enable tailwind colors
    -- parsers can contain values used in |user_default_options|
    sass = { enable = false, parsers = { 'css' } }, -- Enable sass colors
    virtualtext = '■',
    -- update color values even if buffer is not focused
    -- example use: cmp_menu, cmp_docs
    always_update = false,
  },
  filetypes = {
    '*',
  },
}

return M
