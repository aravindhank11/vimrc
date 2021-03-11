"****************************** Basic set **********************************"
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set softtabstop=4
set novisualbell
set title
set number
set smarttab autoindent smartindent cindent
set hlsearch
set incsearch   " search as characters are entered
set background=dark
" Search dir you are currently in and then recursively
set path=.,,**

" Right side word limit "
set colorcolumn=100
hi ColorColumn ctermbg=grey guibg=grey

"***************************** Basic Key mappings ******************************"
" Go to start and end of line using Ctrl+A and Ctrl+E "
imap <C-e> <ESC>A
imap <C-a> <ESC>I
nnoremap <C-e> <ESC>A
nnoremap <C-a> <ESC>I

" Tabs "
nnoremap te :tabedit
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

"****************************** Plugins ******************************"
call plug#begin('~/.vim/plugged')
" Git stuffs "
Plug 'https://github.com/tpope/vim-fugitive.git'

" What branch am I in ? "
Plug 'https://github.com/vim-airline/vim-airline.git'

" Rainbow Paranthesis "
Plug 'https://github.com/frazrepo/vim-rainbow.git'

" What changes am I making in git tree "
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Fuzzy finder "
Plug 'https://github.com/junegunn/fzf.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
call plug#end()


"***************************** Pluggin Key mappings ******************************"
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

" fuzzy finder "
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

"****************************** Plugin set **********************************"
" Rainbow paranthesis enable "
let g:rainbow_active = 1

" git colorful what changes am I making "
set updatetime=1000
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4


"****************************** Add cscope **********************************"
cs add $CSCOPE_DB
