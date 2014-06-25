let is_old = version < 703

if is_old
  let g:pathogen_disabled = ['ultisnips', 'vim-ctrlspace']
endif

call pathogen#infect()

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

set pastetoggle=<F2>
set clipboard=unnamed
au InsertLeave * set nopaste

map <F5> :w<CR>:!clear;python %<CR>
map <F6> :w<CR>:!clear;nosetests %<CR>

set mouse=a  " on OSX press ALT and click

let mapleader = ","

noremap <Leader>t :tabnew<CR>
vnoremap <Leader>s :sort<CR>

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

color wombat256mod

if !is_old
  set colorcolumn=80
endif
highlight ColorColumn ctermbg=233

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/cover/*

let g:multi_cursor_next_key='<C-d>'

let g:vim_markdown_folding_disabled=1

"silent! if emoji#available()
  let g:signify_sign_add = emoji#for('small_blue_diamond')
  let g:signify_sign_change = emoji#for('small_orange_diamond')
  let g:signify_sign_delete = emoji#for('small_red_triangle')
  let g:signify_sign_delete_first_line = emoji#for('collision')
"endif
