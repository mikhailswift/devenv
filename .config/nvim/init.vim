set nocompatible

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
        " Basic plugins (themes/settings)
        call dein#add('tpope/vim-sensible')
        call dein#add('joshdick/onedark.vim')

        " Global utiltiy plugins
        call dein#add('itchyny/lightline.vim')
        call dein#add('scrooloose/nerdtree')
       
        " Git in vim
        call dein#add('tpope/vim-fugitive')
        call dein#add('airblade/vim-gitgutter')
        
        " Auto complete
        call dein#add('Shougo/deoplete.nvim')
        call dein#add('deoplete-plugins/deoplete-go')

        " Golang
        call dein#add('fatih/vim-go')
        
        " Ts/Js
        "call dein#add('pangloss/vim-javascript')
        call dein#add('HerringtonDarkholme/yats.vim')
        call dein#add('mhartington/nvim-typescript', { 'build': './install.sh' })

        " Formatting
        call dein#add('prettier/vim-prettier', { 'build': 'yarn install' })
    call dein#end()
    call dein#save_state()
endif

" Begin vim settings
filetype plugin indent on
syntax enable
set termguicolors
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a
set confirm
set number
set cmdheight=2
set ruler
set autoindent
set hlsearch
set wildmenu
set wildmode=longest:list,full
set hidden
set showcmd
set updatetime=250
set noshowmode
au VimLeave * set guicursor=a:ver25

" color theme
let g:onedark_terminal_italics=1
colorscheme onedark
let g:lightline = { 'colorscheme': 'onedark' }

nmap <C-n> :NERDTreeToggle<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.jsx,*.ts,*.tsx,*.less,*.graphql,*.vue,*.yaml PrettierAsync

" Properly account for spaces in yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:gitgutter_override_sign_column_highlight=0
let g:deoplete#enable_at_startup=1

" Go config
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
