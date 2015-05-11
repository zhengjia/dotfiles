set nocompatible " be iMproved, required

" === VUNDLE ===
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
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
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
Plugin 'rust-lang/rust.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" === GLOBAL SETTING ===
set number
set ruler
set clipboard=unnamed
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set laststatus=2 " always show status
set backspace=2 " enable backspace
set showcmd
set incsearch hlsearch
set nostartofline " maintain cursor position when switching buffer
syntax enable

" color
set background=light
colorscheme solarized

" indent
set expandtab
set shiftwidth=2
set tabstop=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevelstart=99
set foldlevel=1

" runtime
" load from vim distribution
runtime macros/matchit.vim " extend %
set runtimepath^=~/.vim/ctrlp.vim


" === AUTOCMD ===
" auto reload rvmrc
autocmd! bufwritepost .vimrc source %
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" === PLUGIN CONFIG ===

" ctag
set tags+=tags;$HOME

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|.hg|.svn|coverage|log|tmp|vcr_cassettes)$',
  \ 'file': '\v[\/]\.(swp|so|png|jpg|jpeg|gif|svg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_files = 0

" ag
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" tagbar
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

" airline
" disable fileencoding, fileformat
" help airline, customization
let g:airline_section_x = ""
let g:airline_section_y = ""
let g:airline_right_sep=''
" disable whitespace
let g:airline_section_warning = "syntastic"

" indentLine
" enable with :IndentLinesToggle
let g:indentLine_enabled = 0

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_smart_quotes = 1

" syntastic
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key = '<C-s>'
let g:multi_cursor_quit_key = '<Esc>'

" ultisnips
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"

" === KEY MAPPING ===
map <Leader>rtg :!gotags -R -f tags .<CR><CR>
map <Leader>rt :!ctags --exclude=log --exclude=tmp --exclude=coverage -R *<CR><CR>
map <Leader>rtt :!ctags ---exclude=log --exclude=tmp --exclude=coverage -R * -L .srclist<CR><CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <S-r> :NERDTreeFind<CR>

" switch splits
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" Move lines
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" ack
noremap <Leader>a :Ack<space>
" ack for current word (based on cursor)
noremap <Leader>A :Ack<space><C-r><C-w>

" file specific key mapping
au FileType go map <leader>r :!go run %<CR>
au FileType ruby map <leader>r :!ruby %<CR>


" === CUSTOM FUNCTION ===
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


" === LANGUAGES ===

" golang
" format go code
" goimports is too sloooooow
" let g:gofmt_command="goimports"
" gd opens in same window
let g:godef_split=0

" haskell
" haskellmode-vim
set cmdheight=1
au BufEnter *.hs compiler ghc
let g:haddock_browser="open"


