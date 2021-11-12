set nocompatible

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
        call dein#add('~/.cache/dein')
        " Basic plugins (themes/settings)
        call dein#add('tpope/vim-sensible')
        " call dein#add('arcticicestudio/nord-vim')
        call dein#add('dracula/vim', {'name': 'dracula'})

        " Global utiltiy plugins
        call dein#add('itchyny/lightline.vim')
        call dein#add('scrooloose/nerdtree')
        call dein#add('sheerun/vim-polyglot', {'merged': 0})
       
        " Git in vim
        call dein#add('tpope/vim-fugitive')
        call dein#add('airblade/vim-gitgutter')
        
        " Auto complete
        call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
    call dein#end()
    call dein#save_state()
endif

" Begin vim settings
filetype plugin indent on
syntax enable
set termguicolors
set shiftwidth=2
set softtabstop=2
set expandtab
set mouse=a
set confirm
set number relativenumber
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
set cursorline
set undofile
set undolevels=10000
au VimLeave * set guicursor=a:ver25
nnoremap <SPACE> <Nop>
let mapleader= "\<Space>"

" color theme
let g:nord_uniform_diff_background=1
let g:nord_cursor_line_number_background=1
let g:nord_underline=1
colorscheme dracula
let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
	  \   'cocstatus': 'coc#status'
	  \ },
\}

" Opens NERDTree to current file's directory or directory vim was run from
nmap <silent><C-n> :execute (@% == '' ? 'NERDTreeToggle' : 'NERDTreeToggle %')<CR>

let g:gitgutter_override_sign_column_highlight=0

" coc.nvim setup
let g:coc_global_extensions=['coc-tsserver', 
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-rls',
  \ 'coc-snippets',
  \ 'coc-go',
  \ 'coc-pyright',
  \ 'coc-yaml',
  \ 'coc-sh',
  \ ]

set shortmess+=c
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

autocmd FileType javascript,typescript,json,html,css,yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:python3_host_prog = "/usr/bin/python3"
