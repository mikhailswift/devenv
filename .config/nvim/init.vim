set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'dracula/vim',{'as': 'dracula'}
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <leader>rn <Plug>(coc-rename)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd FileType javascript,typescript,json,html,css,yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:python3_host_prog = "/usr/bin/python3"

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install={"phpdoc"},
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
 },
}
