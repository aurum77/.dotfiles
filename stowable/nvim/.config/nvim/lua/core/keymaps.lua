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
map("n", "<Leader>wq", "<C-w>q", opts)

-- Quit all
map("n", "<Leader>q", "<Cmd>qa!<CR>", opts)

-- Toggle terminal
map("n", "<C-t>", "<Cmd>ToggleTerm<CR>", opts)

-- Start external terminal
map("n", "T", "<Cmd>silent !kitty --class=floating_terminal --detach $PWD &<CR>", opts)

-- Clear highlights
map("n", "<Leader>h", "<Cmd>nohlsearch<CR>", opts)

-- File save bind
map("n", "<Leader>fw", "<Cmd>w<CR>", opts)

-- telescope.nvim
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
map("n", "<Leader>f.", "<Cmd>Telescope live_grep hidden=true<CR>", opts)
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
map("n", "<Leader>cc", "<Cmd>!cc -ansi %:p -o /tmp/%:r; /tmp/%:r<CR>", opts)

-- Terminal mode
-- toggleterm.nvim
map("t", "<C-t>", "<Cmd>ToggleTerm<CR>", opts)
map("t", "<ESC>", [[<C-\><C-n>]], opts)
map("t", "fd", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)


-- Insert mode
-- Escape insert mode
map("i", "fd", "<ESC>", opts)
