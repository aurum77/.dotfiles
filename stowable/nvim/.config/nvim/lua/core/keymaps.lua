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

-- Quit all
map("n", "<Leader>q", "<Cmd>wqa!<CR>", opts)

-- Open a terminal
map("n", "T", "<Cmd>silent !alacritty --working-directory=$PWD --class=floating_terminal &<CR>", opts)

-- Clear highlights
map("n", "<Leader>h", "<Cmd>nohlsearch<CR>", opts)

-- File save bind
map("n", "<Leader>fw", "<Cmd>w<CR>", opts)

map("n", "<Leader>wq", "<C-w>q", opts)

-- telescope.nvim
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
map("n", "<Leader>f;", "<Cmd>Telescope commands<CR>", opts)
map("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", opts)
map("n", "<Leader>fm", "<Cmd>Telescope keymaps<CR>", opts)

map("n", "<C-p>", "<Plug>MarkdownPreviewToggle", opts)

-- nvim-tree
map("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", opts)

-- vim-sneak
map("n", "f", "<Plug>Sneak_s", opts)
map("n", "F", "<Plug>Sneak_S", opts)

-- Compile and run single C file with ansi standard
map("n", "<Leader>cc", "<Cmd>!cc -ansi %:p -o %:p:r; %:p:r<CR>", opts)

-- Insert mode
-- Escape insert mode
map("i", "fd", "<ESC>", opts)
