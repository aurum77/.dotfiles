local map = vim.api.nvim_set_keymap
local opts = { silent = true }

-- Set space as leader
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal mode
-- Split navigation and management binds
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Open a terminal
map("n", "T", "<cmd>!alacritty --working-directory=$PWD --title floating_terminal &<CR>", opts)

-- Clear highlights
map("n", "<Leader>h", "<cmd>nohlsearch<CR>", opts)

-- File save bind
map("n", "<Leader>fw", "<cmd>w<CR>", opts)

-- Close split/buffer
map("n", "<Leader>wq", "<C-w>q", opts)

-- telescope.nvim
map("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)

map("n", "<C-p>", "<Plug>MarkdownPreviewToggle", opts)

-- nvim-tree
map("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- vim-sneak
map("n", "f", "<Plug>Sneak_s", opts)
map("n", "F", "<Plug>Sneak_S", opts)

-- Insert mode
-- Escape insert mode
map("i", "fd", "<ESC>", opts)
