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

" Ctrl + T to open in new vim tab "
nnoremap <C-t> <C-w><CR><C-w>T

" line number togggle "
augroup numbertoggle
autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"****************************** Plugins ******************************"
call plug#begin('~/.vim/plugged')

" Git stuffs "
Plug 'https://github.com/tpope/vim-fugitive.git'

" What branch am I in ? "
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

" What changes am I making in git tree "
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Fuzzy finder "
Plug 'https://github.com/junegunn/fzf.git'
Plug 'https://github.com/junegunn/fzf.vim.git'

" Fold "
Plug 'https://github.com/tmhedberg/SimpylFold.git'

" Notes maker "
Plug 'https://github.com/vimwiki/vimwiki.git'

" ripgrep "
Plug 'https://github.com/jremmen/vim-ripgrep.git'
Plug 'https://github.com/mileszs/ack.vim.git'

" color trailing white space "
Plug 'https://github.com/ntpeters/vim-better-whitespace.git'

call plug#end()

"***************************** Pluggin Key mappings ******************************"
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

" fuzzy finder "
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

" fold enable / disable "
set nofoldenable

" cscope "
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"****************************** Plugin set **********************************"
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

" fold "
set foldmethod=syntax
filetype plugin on
filetype indent on

" ripgrep "
let g:ackprg = 'rg --vimgrep --smart-case'
" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>o

syntax on
let g:airline_theme='simple'
highlight Visual cterm=NONE ctermbg=0 ctermfg=Grey guibg=Grey

"****************************** cscope/vim boilerplate **********************************"
if has("cscope") "If vim is compiled with cscope

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " Find and add a cscope file. Either from CSCOPE_DB or by searching for it
    " recursively starting in the CWD and going up to /
    if $CSCOPE_DB != ""
        set nocscopeverbose
        cs add $CSCOPE_DB
    else
        " Get all parts of our current path
        let dirs = split($PWD, '/')
        " Start building a list of paths in which to look for cscope.out
        let paths = ['/']
        " /foo/bar/baz would result in the `paths` array containing:
        " [/ /foo /foo/bar /foo/bar/baz]
        for d in dirs
            let paths = add(paths, paths[len(paths) - 1] . d . '/')
        endfor

        " List is backwards search order, so reverse it.
        for d in reverse(paths)
            let cscope_file = d . "/cscope.out"
            if filereadable(cscope_file)
                execute('cs add ' . cscope_file)
                break
            endif
        endfor
    endif

    " show msg when any other cscope db added
    set cscopeverbose
endif
