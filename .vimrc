set nocompatible


set runtimepath+=~/.vim/bundle/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle/dein')
    call dein#begin('~/.vim/bundle/dein')
        " Plugins
        call dein#add('majutsushi/tagbar')
        call dein#add('Shougo/deoplete.nvim')
        call dein#add('zchee/deoplete-go', { 'build': 'make' })
        call dein#add('fatih/vim-go')
        call dein#add('tpope/vim-sensible')
        call dein#add('icymind/NeoSolarized')
        call dein#add('scrooloose/nerdtree')
        call dein#add('pangloss/vim-javascript')
        call dein#add('vim-airline/vim-airline')
        call dein#add('maksimr/vim-jsbeautify')
        call dein#add('airblade/vim-gitgutter')
        call dein#add('tpope/vim-fugitive')
    call dein#end()
    call dein#save_state()
endif





" Begin vim settings
filetype plugin indent on
syntax enable

" Solarized theme
colorscheme NeoSolarized
"colorscheme NeoSolarized
set background=dark

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

" JsBeautify config
autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.json :call JsBeautify()
autocmd BufWritePre *.jsx :call JsBeautify()
autocmd BufWritePre *.css :call JsBeautify()
autocmd BufWritePre *.html :call JsBeautify()

" Properly account for spaces in taml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set termguicolors

let g:gitgutter_override_sign_column_highlight=0

let g:deoplete#enable_at_startup=1
