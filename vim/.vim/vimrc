set nocompatible                " remove fallBack Vi

so ~/.vim/plugins.vim           " read pluginsFile

set t_Co=256                    " Use 256 Colors

syntax enable
colorscheme atom-dark-256

set guioptions-=T 		        " Removes top toolbar
set guioptions-=r 		        " Removes right hand scroll bar
set guioptions-=R 		        " Removes right hand scroll bar
set guioptions-=l 		        " Removes left hand scroll bar
set guioptions-=L 		        " Removes left hand scroll bar

set linespace=15

set foldcolumn=0

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags                   " ctags file
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,

set hlsearch                    " highlight searchresult
set incsearch                   " incrimental search

set splitbelow                  " split below
set splitright                  " split right

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"----- Mappings  -------------------------------------------------

"cltr-l = normal
inoremap <C-l> <Esc>

"edit vimrc
nmap <leader>ev :tabedit $MYVIMRC<cr>

"clear searchHL
nmap <leader><space> :nohlsearch<cr>

"fast saves 
nmap <leader>w :w!<cr>

"fast buffer Switching
nmap <leader>1 :bprev<cr>
nmap <leader>2 :bnext<cr>
nmap <leader>3 :buffers<cr>




"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
"nmap <C-v> :vertical resize +5<cr>
"nmap 25 :vertical resize 40<cr>
"nmap 50 <c-w>=
"nmap 75 :vertical resize 120<cr>

"Quickly browse to any tag/symbol in the project.
""Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>
nmap <Leader>fr :!ctags -R --exclude=vendor --exclude=node_modules<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %



"----- Plugins --------------------------------------------------
nmap <C-b> :NERDTreeToggle<cr>
"nmap <C-r> :CtrlPBufTag<cr>        " Search class/tag/functions
nmap <C-r> :CtrlPMRUFiles<cr>


"----- Plugins Settings -----------------------------------------

"/ -- CtrlP --
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/ -- NerdTree --
let NERDTreeHijackNetrw = 0


"----- Auto Commands---------------------------------------------

"AutoSource vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost vimrc source %
augroup END


"-------------Tips and Reminders--------------"
"" - Press 'zz' to instantly center the line where the cursor is
"" - yyp - copyAndPaste direct line
"" - u/. - undo redo 

"" - ^]  - find function where i am 

"" Buffer ,1,2,3 just for now til i find better way

"" cs change surround , ds delete sirround
"" cst change tag osv

