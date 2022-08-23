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
map("n", "<Leader>qw", "<Cmd>wqa!<CR>", opts)
map("n", "<Leader>qa", "<Cmd>qa!<CR>", opts)

-- Toggle terminal
map("n", "<C-t>", "<Cmd>ToggleTerm<CR>", opts)

-- Start external terminal
map("n", "T", "<Cmd>silent !kitty --class=floating_terminal --detach $PWD &<CR>", opts)

-- Clear highlights
map("n", "<Leader>h", "<Cmd>nohlsearch<CR>", opts)

-- File save bind
map("n", "<Leader>fw", "<Cmd>wa<CR>", opts)

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

-- Formatting
map("n", "<Leader>f", "<Cmd>Format<CR>", opts)

-- Toggle between dark and light mode
map("n", "<F1>", "<Cmd>lua _TOGGLE_BACKGROUND()<CR>", opts)

-- Rest.nvim
map("n", "<Leader>rr", "<Plug>RestNvim", opts)
map("n", "<Leader>rl", "<Plug>RestNvimLast", opts)
map("n", "<Leader>rp", "<Plug>RestNvimPreview", opts)

-- nvim-dap
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
map("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
map("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)

-- nvim-dap-ui
map("n", "<Leader>dd", "<Cmd>lua require'dapui'.toggle()<CR>", opts)

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
