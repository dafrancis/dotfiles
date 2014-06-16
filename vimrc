au BufWritePost .vimrc so ~/.vimrc

let is_old = version < 703

if is_old
  let g:pathogen_disabled = ['ultisnips', 'vim-ctrlspace']
endif

call pathogen#infect()

let g:airline#extensions#tabline#enabled = 1
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

let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

let g:multi_cursor_next_key='<C-d>'

let g:vim_markdown_folding_disabled=1
