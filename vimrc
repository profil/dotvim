"runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()

" Use vundle for package management
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'https://bitbucket.org/kisom/eink.vim.git'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fireplace'
Plugin 'chriskempson/base16-vim'
call vundle#end()


syntax on
filetype plugin indent on
colorscheme base16-solarized

"set colorcolumn=80
set background=light
set number
set incsearch
set autowrite " autosave before running :make
set ruler
set autoindent
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=-1
set concealcursor=nc
set conceallevel=1
set wildmenu
set wildmode=longest:full,full
set splitbelow
set splitright

set laststatus=2 " always show statusline
set statusline=%5*\ %n\ %4*\ %f\ %3*%=[%Y%M%R%W]\ %4*\ %l:%c\ %5*\ %P\ 
hi User3 ctermfg=blue ctermbg=magenta
hi User4 ctermfg=white ctermbg=gray
hi User5 ctermfg=black ctermbg=lightgray
"hi User3 guifg=#af875f guibg=#303030 ctermfg=137 ctermbg=236
"hi User4 guifg=#121212 guibg=#606060 ctermfg=233 ctermbg=241
"hi User5 guifg=#121212 guibg=#8a8a8a ctermfg=233 ctermbg=245

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

hi Conceal guibg=NONE guifg=Yellow

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <Leader>f :Unite -start-insert file_rec/async<CR>

" vim-tmux-navigator save on leave
let g:tmux_navigator_save_on_switch = 1
