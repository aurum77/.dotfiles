-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 250 }
  end,
})

-- Redraw on start
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function() vim.loop.kill(pid, WINCH) end, 20)
  end
})

-- Don't draw cursorline if not focused
local cursor_highlight_group = vim.api.nvim_create_augroup("CursorHighlight", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
  command = "lua vim.opt.cursorline = true",
  group = cursor_highlight_group
})
vim.api.nvim_create_autocmd("WinLeave", {
  command = "lua vim.opt.cursorline = false",
  group = cursor_highlight_group
})
