au BufWritePost .vimrc so ~/.vimrc

let is_old = version < 703

if is_old
  let g:pathogen_disabled = ['ultisnips']
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

set t_Co=256
color wombat256mod

filetype off
filetype plugin indent on

set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

if !is_old
  set colorcolumn=80
endif
highlight ColorColumn ctermbg=233

set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,sass,cucumber,vim set ai sw=2 sts=2 et
  autocmd FileType python,javascript,html set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  " Indent p tags
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " indent slim two spaces, not four
  autocmd! FileType *.slim set sw=2 sts=2 et
augroup END

let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

let g:multi_cursor_next_key='<C-d>'

let g:vim_markdown_folding_disabled=1
