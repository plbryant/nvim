local map = vim.keymap.set

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })

map('n', '<C-c>', 'ciw', { desc = 'Change inner word' })
map('n', '<C-y>', 'yiw', { desc = 'Copy inner word' })
map('n', '<C-g>', 'diw', { desc = 'Delete inner word' })

map('n', 'J', 'mzJ`z', { desc = 'One row align items' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Better c-d command' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Better c-u command' })
map('n', 'n', 'nzzzv', { desc = 'Better "n" command' })

map('n', '{', '{zz', { desc = 'Better go to the next block command' })
map('n', '}', '}zz', { desc = 'Better go to the previous block command' })
map('n', '<C-o>', '<C-o>zz', { desc = 'Better go to the previous location' })
map('n', '<C-i>', '<C-i>zz', { desc = 'Better go to the next location' })

map({ 'n', 'v' }, '<leader>p', [["_dP]], { desc = 'Paste withouth override register' })
map({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete withouth override register' })

map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word' })

map('n', '<leader>tn', '<cmd>set rnu!<CR>', { desc = 'Toggle number mode' })

map('v', '<', '<gv', { desc = 'Better align items' })
map('v', '>', '>gv', { desc = 'Better align items' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move elements up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move elements down' })

map({ 'n', 'v' }, 'H', '^', { desc = 'Move the start of the line' })
map({ 'n', 'v' }, 'L', 'g_', { desc = 'Move at the end of the line ' })

map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer.sh<CR>', { desc = 'Execute tmux script' })

map('n', '[n', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']n', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>sd', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

map('n', '<leader>ts', '<cmd>set spell!<CR><cmd>lua vim.notify("Toggle spell")<CR>', { desc = 'Toggle spell' })
map('n', 'z=', '<cmd>Telescope spell_suggest<CR>', { desc = 'Suggest spell' })
