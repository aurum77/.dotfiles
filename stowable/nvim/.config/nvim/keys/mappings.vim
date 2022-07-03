let g:mapleader="\<Space>"

imap fd <esc>
imap Fd <esc>
imap fD <esc>
imap FD <esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap  <C-q> <C-w>q

vnoremap < <gv
vnoremap > >gv

map f <Plug>Sneak_s
map F <Plug>Sneak_S

nmap <C-e> <Cmd>CocCommand explorer<CR>

nmap T :!alacritty --working-directory=%:h --title floating_terminal &<CR>

nmap <C-p> <Plug>MarkdownPreviewToggle
