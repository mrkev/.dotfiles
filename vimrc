set nocompatible
set background=dark

set shortmess+=I

syntax on
filetype plugin indent on
set grepprg=grep\ -nH\ $*

colorscheme elflord
set guifont=Courier:h14
set nohlsearch
set scrolloff=5
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80,81

function Kees_settabs()
    if len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^\\t"')) > len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^ "'))
        set noexpandtab
    endif
endfunction
autocmd BufReadPost * call Kees_settabs()

if has ("gui_running")
  set number
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
endif

let mapleader = ","
nnoremap <leader>nt :NERDTreeToggle<CR>
set laststatus=2

inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set encoding=utf8
set ignorecase
set smartcase
set incsearch
set showmatch
nnoremap <leader><space> :noh<CR>
set listchars=tab:▸\ ,eol:¬

set mouse=a
set wildmenu
set wildmode=list:longest,full
let &t_Co=256
vnoremap <leader>r "hy:.,$s/<C-r>h//gc<left><left><left>

au Syntax tex syn region texZone start="\\begin{ocaml}" end="\\end{ocaml}" 
au Syntax tex syn region texZone start="\\code{" end="}" 

