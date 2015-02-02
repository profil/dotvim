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
Plugin 'kien/rainbow_parentheses.vim'
call vundle#end()


syntax on
filetype plugin indent on
colorscheme solarized

"set colorcolumn=80
set background=dark
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
hi User3 guifg=#af875f guibg=#303030 ctermfg=137 ctermbg=236
hi User4 guifg=#121212 guibg=#606060 ctermfg=233 ctermbg=241
hi User5 guifg=#121212 guibg=#8a8a8a ctermfg=233 ctermbg=245

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

hi Conceal guibg=NONE guifg=Yellow





command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<CR>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction
