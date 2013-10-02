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
" https://github.com/mxcl/homebrew/issues/19942
set regexpengine=1

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

" Start nerd tree if no file is specified
" autocmd vimenter * if !argc() | NERDTree | endif

execute pathogen#infect()

set background=light
colorscheme solarized

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|.hg|.svn|coverage|log|tmp)$',
  \ 'file': '\v[\/]\.(swp|so|png|jpg|jpeg|gif|svg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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
" set nofoldenable        "dont fold by default
set foldlevel=1
