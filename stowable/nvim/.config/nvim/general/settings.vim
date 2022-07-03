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
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set cmdheight=2
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
au! BufWritePost $MYVIMRC source %
let loaded_netrwPlugin = 1
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
