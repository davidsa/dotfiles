vim.g.mapleader = " "

-- Buffers
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>N", ":bp<CR>")
vim.keymap.set("n", "<leader>d", ":bun<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

-- Cursor moving between windows
vim.keymap.set("n", "<C-h>", function()
	vim.cmd.wincmd({ args = { "h" } })
	vim.cmd.TmuxNavigateLeft()
end)

vim.keymap.set("n", "<C-j>", function()
	vim.cmd.wincmd({ args = { "j" } })
	vim.cmd.TmuxNavigateDown()
end)

vim.keymap.set("n", "<C-k>", function()
	vim.cmd.wincmd({ args = { "k" } })
	vim.cmd.TmuxNavigateUp()
end)

vim.keymap.set("n", "<C-l>", function()
	vim.cmd.wincmd({ args = { "l" } })
	vim.cmd.TmuxNavigateRight()
end)

-- Sort
vim.keymap.set("v", "<leader>s", ":sort<CR>")

-- Lines
vim.keymap.set("n", "§", ":m .-2<CR>==")
vim.keymap.set("n", "¶", ":m .+1<CR>==")

vim.keymap.set("v", "¶", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "§", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard
--vim.keymap.set("x", "<leader>p" , "\"_dP")

-- Quick list
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

-- Paste withouth losing content
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>cp", ":let @+ = expand('%')<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
