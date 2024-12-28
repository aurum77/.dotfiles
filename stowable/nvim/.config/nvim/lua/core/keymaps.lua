local map = vim.keymap.set
local opts = require("core.utils").keymap_opts
local utils = require("core.utils")
local ls = require("luasnip")

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
map("n", "<Leader>qw", "<Cmd>wqa!<CR>", opts)
map("n", "<Leader>qa", "<Cmd>qa!<CR>", opts)

-- Toggle terminal
map("n", "<C-t>", "<Cmd>ToggleTerm<CR>", opts)

-- Clear highlights
map("n", "<Leader>hh", "<Cmd>nohlsearch<CR>", opts)

-- File save bind
map("n", "<Leader>fw", "<Cmd>w<CR>", opts)

-- telescope.nvim
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
map("n", "<Leader>f.", "<Cmd>Telescope live_grep hidden=true<CR>", opts)
map("n", "<Leader>f;", "<Cmd>Telescope commands<CR>", opts)
map("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", opts)
map("n", "<Leader>fk", "<Cmd>Telescope keymaps<CR>", opts)
map("n", "<Leader><Leader>", "<Cmd>Telescope buffers<CR>", opts)

-- nvim-tree
map("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", opts)

-- Formatting
map("n", "<C-f>", "<Cmd>Format<CR>", opts)

-- Rest.nvim
map("n", "<Leader>rr", "<Plug>RestNvim", opts)
map("n", "<Leader>rl", "<Plug>RestNvimLast", opts)
map("n", "<Leader>rp", "<Plug>RestNvimPreview", opts)

-- plenary.nvim
map("n", "<Leader>rt", "<Plug>PlenaryTestFile", opts)

-- Center cursor on scroll up or down
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Remove help bind
map("n", "<F1>", "<NOP>", opts)
map("i", "<F1>", "<NOP>", opts)
map("v", "<F1>", "<NOP>", opts)
map("x", "<F1>", "<NOP>", opts)

-- Remove help bind
map("n", "J", "<Cmd>Gitsigns blame_line<CR>", opts)

-- Lsp bindings
map("n", "<Leader>lr", "<Cmd>LspRestart<CR>", opts)
map("n", "<Leader>li", "<Cmd>LspInfo<CR>", opts)
map("n", "<Leader>lm", "<Cmd>Mason<CR>", opts)
map("n", "<Leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", opts)

-- Trouble.nvim
map("n", "<Leader>fa", "<Cmd>Trouble diagnostics toggle focus=true<CR>", opts)
map("n", "<Leader>fd", "<Cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>", opts)

-- Terminal mode
-- toggleterm.nvim
map("t", "<C-t>", "<Cmd>ToggleTerm<CR>", opts)
map("i", "<C-t>", "<Cmd>ToggleTerm<CR>", opts)
map("t", "<ESC>", [[<C-\><C-n>]], opts)
map("t", "fd", [[<C-\><C-n>]], opts)
map("t", "<C-l>", "<C-l>", opts)

-- Insert mode
-- Escape insert mode
map("i", "fd", "<ESC>", opts)
map("i", "<C-c>", "<ESC>", opts)

-- Lazy
map("n", "<Leader>pl", "<Cmd>Lazy<CR>", opts)

-- DAP
map("n", "<F5>", function()
	require("dap").continue()
end)
map("n", "<F10>", function()
	require("dap").step_over()
end)
map("n", "<F11>", function()
	require("dap").step_into()
end)
map("n", "<F12>", function()
	require("dap").step_out()
end)
map("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
map("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
map("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
map("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
map("n", "<Leader>dl", function()
	require("dap").run_last()
end)

-- Snippets
map({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
map({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
map({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

map({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
