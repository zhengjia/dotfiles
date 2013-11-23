set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'bufkill.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-ruby/vim-ruby'
Bundle 'majutsushi/tagbar'
Bundle 'rking/ag.vim'

set showcmd
set incsearch hlsearch

" golang
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
set runtimepath+=$GOROOT/misc/vim

syntax on
filetype plugin indent on
set number
set ruler

set expandtab
set shiftwidth=2
set tabstop=2
set laststatus=2

set clipboard=unnamed

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set backspace=2
set runtimepath^=~/.vim/ctrlp.vim

set tags+=tags;$HOME

" auto reload rvmrc
autocmd! bufwritepost .vimrc source %

set background=light
colorscheme solarized

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|.hg|.svn|coverage|log|tmp|vcr_cassettes)$',
  \ 'file': '\v[\/]\.(swp|so|png|jpg|jpeg|gif|svg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_files = 0

au FileType go map <leader>r :!go run %<CR>
au FileType ruby map <leader>r :!ruby %<CR>
map <Leader>rt :!ctags --exclude=log --exclude=tmp --exclude=coverage -R *<CR><CR>
map <Leader>rtt :!ctags ---exclude=log --exclude=tmp --exclude=coverage -R * -L .srclist<CR><CR>
nmap <C-n> :NERDTreeToggle<CR>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevelstart=99
set foldlevel=1

" ack
noremap <Leader>a :Ack<space>
" ack for current word (based on cursor)
noremap <Leader>A :Ack<space><C-r><C-w>

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>
