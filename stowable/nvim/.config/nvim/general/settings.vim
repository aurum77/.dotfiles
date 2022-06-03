colorscheme gruvbox
syntax enable
set hidden
set encoding=utf-8
set ruler
set splitbelow
set splitright
set t_Co=256
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=0
set noshowmode
set cursorline
set background=dark
set updatetime=300
set timeoutlen=500
set number
set relativenumber
set clipboard=unnamedplus
set mouse=a
let g:airline_theme='gruvbox'
let g:airline_symbols_ascii=1
let g:mapleader="\<Space>"
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
au! BufWritePost $MYVIMRC source %
