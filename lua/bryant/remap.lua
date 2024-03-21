local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>")

map('n', '<C-c>', 'ciw')

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")

map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")

map("x", "<leader>p", [["_dP]])

map({"n", "v"}, "<leader>d", [["_d]])

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader>tn", "<cmd>set rnu!<CR>")

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

map('i', '<M-h>', '<Left>')
map('i', '<M-l>', '<Right>')

map('v',"<","<gv")
map('v',">",">gv")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map({'n','v'}, "H", "^")
map({'n','v'}, "L", "g_")
map({'n','i','v'}, '<C-tab>', '<cmd> b# <CR>')

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")

map('n', '[h', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']l', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>sd', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
