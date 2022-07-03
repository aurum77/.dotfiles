" Higlight on copy
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=250}

" Redraw after launch
autocmd VimEnter * call timer_start(20, { tid -> execute(':silent exec "!kill -s SIGWINCH $PPID"')})

" Open markdown preview on a new window
function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

