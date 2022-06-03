autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=250}
autocmd VimEnter * call timer_start(20, { tid -> execute(':silent exec "!kill -s SIGWINCH $PPID"')})
