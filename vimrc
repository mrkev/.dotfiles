set nocompatible                        " Necesary for lots of cool vim things

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700                         " Remember 700 lines of history

filetype on                             " Enable file type detection
filetype plugin on                      " Enable filetype plugins
filetype indent on                      " "

set autoread                            " Autoread files when changed externally

set encoding=utf8                       " Set utf8 as standard encoding
set ffs=unix,dos,mac                    " Use Unix as the standard file type

set backspace=eol,start,indent          " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l                  " "

inoremap jj <ESC>                       " Remap jj to escape in insert mode.

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

set lazyredraw   " redraw only when we need to (faster performance)
 
"Automatically cd into the directory that the file is in:
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set so=7                            " Set 7 lines to the cursor - when moving vertically using j/k

set wildmenu                        " Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc         " Ignore compiled files
set wildmode=longest:full,full      " complete to the longest common string first



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup 
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI BRUH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai               " Install at https://github.com/tomasr/molokai
let g:molokai_original = 1        " match the original monokai background color
set background=dark               " Let vim know we are on a dark terminal


set showmatch                     " highlight matching [{()}] when text indicator is over them
set mat=2                         " Blink 2 tenths of a second when matching brackets

set cmdheight=2                   " Height of the command bar
set shortmess=a                   " Decrease Hit ENTER to continue message size

set scrolloff=5                   " minimum 5 screen lines above and below the cursor
set number                        " Show line numbers
set cul                           " Highlight current line

set smarttab                      " Be smart when using tabs ;)
set expandtab                     " make TAB a shortcut for spaces
set tabstop=2                     " 2 visual spaces per TAB
set softtabstop=2                 " 2 spaces in tab when editing
set shiftwidth=2                  " "
set expandtab                     " Use spaces instead of tabs
set ai                            " Auto indent
set si                            " Smart indent
set wrap                          " Wrap lines

set colorcolumn=80                " Ruler on column 80
set lbr                           " Linebreak on 500 characters
set tw=500                        " "

set ruler                         " Current position in lower left corner (not showing /:)

nnoremap gV `[v`]                 " highlight last inserted text

set showcmd                       " show last command in bottom bar (overwritten by Powerline)

syntax enable                     " Enable syntax highlighting
set grepprg=grep\ -nH\ $*         " Needed for Syntax Highlighting


""""""""""""
" Folding
""""""""""""
  set foldenable          " enable folding
  set foldlevelstart=10   " open most folds by default
  set foldnestmax=10      " 10 nested fold max
  set foldmethod=indent   " fold based on indent level

" space open/closes folds
" nnoremap <space> za


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <space> /                 " Map <Space> to / (search)
map <c-space> ?               " Map Ctrl-<Space> to ? (backwards search)

set incsearch                 " Makes search act like search in modern browsers
set hlsearch                  " Highlight search results
set ignorecase                " Ignore case when searching
set smartcase                 " When searching try to be smart about cases 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has ("gui_running")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Thanks to http://amix.dk/vim/vimrc.html and the web in general ""