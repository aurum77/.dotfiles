vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = true
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.linebreak = true
vim.opt.signcolumn = "auto"
vim.opt.termguicolors = true
vim.opt.mouse = "n"
vim.opt.cmdheight = 1
vim.opt.helpheight = 7777
vim.opt.fillchars = {
	vert = "│", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "░", -- alternatives =  ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
