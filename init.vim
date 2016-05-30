" Use vim-plug for package management
call plug#begin('~/.config/nvim/bundle')
Plug 'junegunn/vim-plug'
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'eapache/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
call plug#end()


syntax on
filetype plugin indent on
colorscheme base16-solarized

:let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"set colorcolumn=80
"set background=light
set number
set incsearch
set ignorecase
set smartcase
set autowrite " autosave before running :make
set ruler
set autoindent
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=-1
set concealcursor=nc
set conceallevel=0
set wildmenu
set wildignorecase
set wildmode=longest,full
set splitbelow
set splitright

set laststatus=2 " always show statusline
set statusline=%#LineNr#\ %n\ %f\ %=[%Y%M%R%W]\ %l:%c\ %P\ 

if has("gui_running")
	if has("mac")
		set guifont=Inconsolata:h11
	elseif has("unix")
		set guifont=Inconsolata\ 10
		set guioptions=agit
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

augroup haskell
	autocmd!
	autocmd BufRead,BufNewFile *.hs setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

augroup clojure
	autocmd!
	let g:rbpt_colorpairs = [
	    \ ['red',         'RoyalBlue3'],
	    \ ['brown',       'SeaGreen3'],
	    \ ['blue',        'DarkOrchid3'],
	    \ ['gray',        'firebrick3'],
	    \ ['green',       'RoyalBlue3'],
	    \ ['cyan',        'DarkOrchid3'],
	    \ ['darkred',     'firebrick3'],
	    \ ['brown',       'RoyalBlue3'],
	    \ ['darkblue',    'DarkOrchid3'],
	    \ ['gray',        'firebrick3'],
	    \ ['darkgreen',   'RoyalBlue3'],
	    \ ['darkmagenta', 'SeaGreen3'],
	    \ ['darkcyan',    'DarkOrchid3'],
	    \ ['red',         'firebrick3'],
	    \ ]
	autocmd Filetype clojure RainbowParenthesesActivate
	autocmd Filetype clojure RainbowParenthesesLoadRound
	autocmd Filetype clojure RainbowParenthesesLoadSquare
	autocmd Filetype clojure RainbowParenthesesLoadBraces
augroup END

let mapleader = ','

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap jk <esc>
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <silent><BS> :set hlsearch!<CR>
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

hi Conceal guibg=NONE guifg=Yellow

tnoremap <Esc><Esc> <c-\><c-n>
tnoremap <silent> <c-h> <c-\><c-n><c-w>h
tnoremap <silent> <c-j> <c-\><c-n><c-w>j
tnoremap <silent> <c-k> <c-\><c-n><c-w>k
tnoremap <silent> <c-l> <c-\><c-n><c-w>l
tnoremap <silent> <Esc><c-l> <c-l>

set backspace=2

augroup terminal
	autocmd!
	autocmd WinEnter term://* startinsert
augroup END

