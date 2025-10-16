local lsp = require("plugins.lsp.opts")
local opts = lsp.opts

-- Set space as leader
vim.keymap.set("", "<Space>", "<Nop>", opts)

-- Normal mode
-- Split navigation and management binds
vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", opts)
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", opts)
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", opts)
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", opts)

-- Quit all
vim.keymap.set("n", "<Leader>qw", "<Cmd>wqa!<CR>", opts)
vim.keymap.set("n", "<Leader>qa", "<Cmd>qa!<CR>", opts)

-- Clear highlights
vim.keymap.set("n", "<Leader>hh", "<Cmd>nohlsearch<CR>", opts)

-- Save all
vim.keymap.set("n", "<Leader>fw", "<Cmd>wa!<CR>", opts)

-- Center cursor on scroll up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Remove help bind
vim.keymap.set("n", "<F1>", "<NOP>", opts)
vim.keymap.set("i", "<F1>", "<NOP>", opts)
vim.keymap.set("v", "<F1>", "<NOP>", opts)
vim.keymap.set("x", "<F1>", "<NOP>", opts)

-- Insert mode
-- Escape insert mode
vim.keymap.set("i", "fd", "<ESC>", opts)
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
