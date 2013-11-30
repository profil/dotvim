runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme eink

set colorcolumn=80
set background=dark
set number
set incsearch
set autowrite " autosave before running :make
set ruler
set autoindent
set tabstop=4
set shiftwidth=4

if has("gui_running")
	if has("mac")
		set guifont=Inconsolata:h11
	elseif has("unix")
		set guifont=Inconsolata\ 11
	endif
endif


autocmd BufRead,BufNewFile *.tex setlocal makeprg=pdflatex\ % textwidth=75
autocmd BufRead,BufNewFile *.md setlocal textwidth=75
