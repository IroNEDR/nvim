vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>vv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><Tab>", "<C-w>w")
vim.keymap.set("n", "<leader>o", ':<C-u>call append(line("."),   repeat([""], v:count1))<CR>')
vim.keymap.set('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

