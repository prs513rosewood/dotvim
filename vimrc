" - Vundle configuration -----------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" user plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/Conque-GDB'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jamessan/vim-gnupg'
Plugin 'derekwyatt/vim-scala'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'ctrlpvim/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----------------------------------------------------------------------------------------

" Turn off the lights...
set background=dark

" Activate mouse
set mouse=a

" On/Off switch
function! Switchlight()
  if &background == "light"
    set background=dark
  else
    set background=light
  end
endfunction

" Map F12 to light switch
nnoremap <F12> :call Switchlight()<CR>

" Set tab spaces (mixed mode here)
set softtabstop=2
set shiftwidth=2

" Set tabs for python files
au FileType python setlocal expandtab shiftwidth=2

" Set bash-like autocomplete
set wildmenu
set wildmode=list:longest

" Enable embed parameters
set modeline

" Indent options
set cinoptions+=(0,Ws " Align function parameters
set cinoptions+=g0    " Don't indent class scopes

" Ignore case
set ignorecase

" Change directory to current file's
set autochdir

" Map leader
let mapleader="\<space>"

" Edit ~/.vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Buffer navigation
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
nnoremap gG :e #<CR>

" Semi-colon helper
nnoremap é :
nnoremap ; :

" Folds
set foldmethod=manual

" Tab tricks
nnoremap <C-t> :tabedit .<CR>

" Use mouse
set mouse=a

" Bind esc to jj in insert mode
"inoremap jj <Esc>

" Undo persistance
set undofile
set undodir=~/.vim/undodir

" Switching between header and implementation
nnoremap <F4> :e %:p:s,.hh$,.X123X,:s,.cc$,.hh,:s,.X123X$,.cc,<CR>

" Mapping to replace . with ->
nnoremap <leader>a f.i-><del><esc>

" Highlighting for search
set hlsearch
nnoremap <C-n> :nohl<CR>
nohl

" Spell language
set spelllang=en_us,fr

" Snippet author
let g:snips_author = "Lucas Frérot"
let g:snips_email = "<lucas.frerot@epfl.ch>"

" SnipMate hotkey (has to be recursive map)
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" ConqueGDB options
let g:ConqueGdb_SrcSplit = 'left'

" Tags options
set tags=~/.vim/tags
command! AkTags !ctags -f ~/.vim/tags -R ~/Documents/akantu
nnoremap <C-b> :pop<CR>
nnoremap <C-]> g<C-]>

" Run current file as python script
command! Pyrun pyfile %

" Track vim's working directory when browsing through netrw
let g:netrw_keepdir=0

" Open quickfix window when make is done
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Treat geo (gmsh description) files as C files (for basic syntax
" highlighting)
autocmd BufRead *.geo set filetype=c

" Set linebreak on for text files
autocmd BufRead *.tex,*.txt setlocal linebreak

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/doxygen/*        " Linux/MacOSX
