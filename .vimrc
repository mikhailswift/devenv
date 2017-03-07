set nocompatible
filetype off

" include vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer' }
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" End of plugins, don't add after this
call vundle#end()

" Begin vim settings
filetype plugin indent on

" Solarized theme
set background=dark
colorscheme solarized

" 4 spaces when tab is pressed
set shiftwidth=4
set softtabstop=4
set expandtab

" Mouse mode, activate!
set mouse=a

" Instead of throwing an error, ask to confirm
set confirm

" Line numbers are important
set number

" Bigger command window
set cmdheight=2

" Show the cursor position
set ruler

" Match indenting
set autoindent

" Highlight searches
set hlsearch

" tab complete vim commands
set wildmenu
set wildmode=longest:list,full

" Hide buffers instead of closing
set hidden

" show me the commands
set showcmd

set updatetime=250

" F8 will toggle my tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.json :call JsBeautify()
autocmd BufWritePre *.jsx :call JsBeautify()
autocmd BufWritePre *.css :call JsBeautify()
autocmd BufWritePre *.html :call JsBeautify()
