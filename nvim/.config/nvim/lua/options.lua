local opt = vim.opt

vim.g.mapleader = " "
opt.tabstop = 2
opt.softtabstop = 2
opt.signcolumn = "yes"
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.linebreak = true
opt.termguicolors = true
opt.encoding = "utf8"
opt.number = true
opt.relativenumber = true
opt.hlsearch = true
-- start hlsearch as I type
opt.incsearch = true
opt.ignorecase = true
-- search case insensitive until I add a capital letter
opt.smartcase = true
opt.modeline = true
opt.splitbelow = true
opt.splitright = true

if vim.fn.executable("rg") then
    vim.o.grepprg = "rg --vimgrep --hidden -g !.git"
  end
