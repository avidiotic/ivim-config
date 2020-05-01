" <-- Pathogen package management -->
filetype off

execute pathogen#infect()
execute pathogen#helptags()
execute pathogen#runtime_append_all_bundles()


" <-- General & VIM UI -->

" Enable syntax highlighting
syntax enable

" Set compatibility to negative
set nocompatible

" Enable filetype plugins
filetype plugin indent on

" Set colorscheme
set termguicolors
set background=dark
colorscheme hybrid_material

" Allow bold
let g:enable_bold_font=1

" Allow italic
let g:enable_italic_font=1

" Set guifont
set guifont=JetBrains\ Mono\ Italic\ Nerd\ Font\ Complete\ Mono.ttf:h14
set guifont=JetBrains\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono.ttf:h14
set guifont=JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono.ttf:h14

" Sets number of lines of history remembered
set history=500

" Set to autoread an externally edited file
set autoread
au FocusGained,BufEnter * checktime

" Always show tabs bar
set showtabline=2

" Enable wildmenu
set wildmenu

" Show current position
set ruler

" Show line number
set number

" Set command bar height
set cmdheight=1

" Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Start scrolling 3 lines before
set scrolloff=3

" Ignore case when searching
set ignorecase

" Enable smart case for search
set smartcase

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Allow searches to wrap around to the top of file
set wrapscan

" Disable re-drawing during macro execution (performance config)
set lazyredraw

" For regular expression support
set magic

" Show matching indicators
set showmatch

" Use spaces instead of tabs
set expandtab

" Smart tabs
set smarttab

" Expand tab to 4 spaces
set shiftwidth=4
set tabstop=4

" Enable auto-indent
set ai

" Enable smart-indent
set si

" Wrap lines
set wrap

" Return to last edit position when reopening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always display status line
set laststatus=2

" Remove Mode notification below status line because using lightline
set noshowmode

" Delete trailing white spaces on save for certain filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg("/")
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.vimrc :call CleanExtraSpaces()
endif


" <-- Mappings -->

" Using Cmd+t to create new tab
imap <D-t> <Esc>:tabnew<CR>
nmap <D-t> :tabnew<CR>

" Using Cmd+w to close tab
" :tabclose if n(tabs)>1 else :q
if tabpagenr('$') > 1
    imap <D-w> <Esc>:tabclose<CR>
    nmap <D-w> :tabclose<CR>
else
    imap <D-w> <Esc>:q<CR>
    nmap <D-w> :q<CR>
endif

" Using Cmd+s to save file
imap <D-s> <Esc>:w<CR>i
nmap <D-s> :w<CR>

" Using Cmd+Left/Right to traverse tabs
imap <D-Left> <Esc>:tabp<CR>
nmap <D-Left> :tabp<CR>
imap <D-Right> <Esc>:tabn<CR>
nmap <D-Right> :tabn<CR>

" Using Ctrl+r to load .vimrc
nmap <C-r> :source ~/.vimrc<CR>

" Using Ctrl+o to open NERDTree
nmap <C-o> :NERDTree<CR>

" Using Cmd+o to open file/folder picker
nmap <D-o><D-f> :idoc<CR>
nmap <D-o><D-d> :idoc dir<CR>

" Using Cmd+c to toggle spell checking
imap <D-c> <Esc>:setlocal spell!<CR>i
nmap <D-c> :setlocal spell!<CR>


" <-- Plugin Setup -->

" Remove ^G from NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1

" Use lightline for tabs
" let g:lightline.tabline = {'left': [['tabs']], 'right': [['close']]}
" set showtabline=2
" set guioptions-=e
