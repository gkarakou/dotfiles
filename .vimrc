"do this first
"mkdir -p ~/.vim/bundle
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"vim .vimrc --> :PluginInstall
"sh .vim/bundle/fonts/install.sh
"install powerline fonts for airline statusbar FROM https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
set nocompatible	" Use Vim defaults (much better!)
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/syntastic'

Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'

Plugin 'davidhalter/jedi-vim'

Plugin 'duff/vim-trailing-whitespace'

Plugin 'heavenshell/vim-pydocstring'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'cburroughs/pep8.py'

Plugin 'powerline/powerline'

Plugin 'powerline/fonts'

Plugin 'airblade/vim-gitgutter'

"Plugin 'Localtog/vim-powerline'

call vundle#end()

set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set shell=/bin/sh    " change the shell for zsh compatibility
set nomodeline
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.img,*.ko
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h
" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search patter
set t_Co=256
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
filetype indent on
set number
set laststatus=2
filetype plugin on
endif
filetype indent on
filetype plugin on
set foldmethod=indent
set foldlevel=99
set hidden
set confirm
set laststatus=2
" Disable stupid backup and swap files - they trigger too many events
"" for file system watchers
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8
set term=xterm-256color
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
"if &term=="xterm"
"     set t_Co=8
"     set t_Sb=[4%dm
"     set t_Sf=[3%dm
"endif
" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
"-----------------------------------
"start plugins
"plugin manager pathogen
"SuperTab
"let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
au FileType python set omnifunc=pythoncomplete#Complete
"pymode
" let g:pymode_rope = 0
"gundo
nnoremap <F6> :GundoToggle<CR>
"airline plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_warning_symbol = "!"
let g:syntastic_error_symbol = "✗"
let g:syntastic_python_checkers = ['python','pylint','pyflakes']
let g:syntastic_javascript_checkers = ['jsl']
let g:syntastic_html_checkers = ['validator','w3']
let g:syntastic_php_checkers = ['php','phpcs','phpmd']
let g:syntastic_php_phpcs_args = "--standard=zend -n --report=csv"
"NERDTree
" next one will focus on NERDTree when opening a file
"autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
" next one will focus on the file itself when opening it
autocmd BufNew * wincmd l
"Nerdtreetabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1
"tagbar
nmap <F8> :TagbarToggle<CR>
"vim-theming
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
let g:solarized_visibility="high"
let g:solarized_degrade= 1
let g:solarized_contrast="high"
let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols='unicode'
"exuberant ctags
"set tags=./tags;/
"easytags
"let g:easytags_dynamic_files = 1
"plugins end
"--------------------------------------
