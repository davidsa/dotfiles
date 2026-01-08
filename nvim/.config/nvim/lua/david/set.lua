-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.hlsearch = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.number = true

-- Clipboard
vim.opt.clipboard = "unnamedplus,unnamed"

-- Clipboard for WSL
vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i",
    ["*"] = "win32yank.exe -i",
  },
  paste = {
    ["+"] = "win32yank.exe -o",
    ["*"] = "win32yank.exe -o",
  },
}
-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = false
vim.opt.scrolloff = 8

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Mouse
-- let resize buffer with mouse
vim.opt.mouse = "n"
