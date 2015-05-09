set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bufkill.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-ruby/vim-ruby'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-ragtag'
Plugin 'fatih/vim-go'
Plugin 'cespare/vim-toml'
Plugin 'shime/vim-livedown'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set showcmd
set incsearch hlsearch
set nostartofline
" golang
" format go code
" goimports is too sloooooow
" let g:gofmt_command="goimports"

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/Users/zjia/opensource/rust/src/etc/vim
filetype plugin indent on
syntax on

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
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

au FileType go map <leader>r :!go run %<CR>
au FileType ruby map <leader>r :!ruby %<CR>
map <Leader>rtg :!gotags -R -f tags .<CR><CR>
map <Leader>rt :!ctags --exclude=log --exclude=tmp --exclude=coverage -R *<CR><CR>
map <Leader>rtt :!ctags ---exclude=log --exclude=tmp --exclude=coverage -R * -L .srclist<CR><CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <S-r> :NERDTreeFind<CR>

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

" haskell
" haskellmode-vim
set cmdheight=1
au BufEnter *.hs compiler ghc
let g:haddock_browser="open"

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" disable fileencoding, fileformat
" help airline, customization
let g:airline_section_x = ""
let g:airline_section_y = ""
let g:airline_right_sep=''
" disable whitespace
let g:airline_section_warning = "syntastic"

let g:godef_split=0

" IndentLinesToggle
let g:indentLine_enabled = 0

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

