runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme molokai

"set colorcolumn=80
set background=dark
set number
set incsearch
set autowrite " autosave before running :make
set ruler
set autoindent
set tabstop=4
set shiftwidth=4
set concealcursor=nc
set conceallevel=1
set wildmenu
set wildmode=longest:full,full

set laststatus=2 " always show statusline
set statusline=%n\ %F\ %y%=%l/%L

if has("gui_running")
	if has("mac")
		set guifont=Inconsolata:h11
	elseif has("unix")
		set guifont=Inconsolata\ 10
		set guioptions=aegit
	endif
endif


augroup latex
	autocmd!
	autocmd BufRead,BufNewFile *.tex setlocal makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ % errorformat=%f:%l:\ %m textwidth=75
augroup END

augroup markdown
	autocmd!
	autocmd BufRead,BufNewFile *.md setlocal textwidth=75 formatoptions+=an
augroup END


let mapleader = ','

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap jk <esc>

hi Conceal guibg=NONE guifg=Yellow
