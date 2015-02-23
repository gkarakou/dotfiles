if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set shell=/bin/bash    "change the shell
set nomodeline
"set wildignore=*.so
set wildignore=*.ko
set wildignore=*.img
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
set laststatus=2
filetype plugin on
endif
filetype indent on
filetype plugin on
set foldmethod=indent
set foldlevel=99
set hidden
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif
" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
"-----------------------------------
"start plugins
"plugin manager pathogen
execute pathogen#infect()
call pathogen#helptags()
"SuperTab
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview
"au FileType python set omnifunc=pythoncomplete#Complete
"pymode
" let g:pymode_rope = 0

"ycm
let g:ycm_path_to_python_interpreter = '/usr/bin/python2.7'

"airline plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
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
autocmd vimenter * NERDTree
"tagbar
nmap <F8> :TagbarToggle<CR>
"vim-theming
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
let g:solarized_visibility=   "high"
let g:solarized_degrade= 1
let g:solarized_contrast  =   "high"
"plugins end
"--------------------------------------
