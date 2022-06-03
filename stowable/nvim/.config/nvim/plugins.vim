" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent! !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Declare plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'justinmk/vim-sneak'
call plug#end()
