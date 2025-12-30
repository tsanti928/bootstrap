" General {
    set nocompatible        " Must be first line

    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing

    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=100
    set hidden                          " Allow buffer switching without saving

    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:>\ ,trail:*,extends:#,nbsp:. " Highlight problematic whitespace
    " :retab fixes all tabs to spaces

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Key (re)Mappings {

    let mapleader = ','

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk
    noremap <leader>tmp :!mkdir /tmp/.vim.backup <CR>
    noremap <leader>s :%s/\s\+$//e <CR>
    noremap <leader>dir :cd %:p:h <CR>
    noremap <leader>u :set guifont=Monospace\ 16<CR>
    noremap <leader>d :set guifont=Monospace\ 13<CR>
    noremap <leader>ig :IndentGuidesToggle<CR>
    noremap <leader>f :let @f = expand('%:p')<CR>
    noremap <leader>p :set paste!<CR>
    noremap <leader>b i<C-v>u2610<Esc>
    noremap <leader>c <Esc>r<C-v>u2611<Esc>
    noremap <leader>tt :set expandtab!<CR>
    " Use OSC-52 sequence to copy to system clipboard
    vnoremap <Leader>y :OSCYankVisual<CR>
" }

    colorscheme desert

    "Font
    set guifont=Monospace\ 13

    "Encoding
    set encoding=utf-8

    if has("gui_win32")
        if !isdirectory($TMP . "/.vim.backup")
            call mkdir($TMP . "/.vim.backup", "p")
        endif
        set backupdir=$TMP/.vim.backup
        set directory=$TMP/.vim.backup
    else
        if !isdirectory("/tmp/.vim.backup")
            call mkdir("/tmp/.vim.backup", "p")
        endif
        set backupdir=/tmp/.vim.backup
        set directory=/tmp/.vim.backup
    endif

    set laststatus=2

    "Fix for funky chars
    set t_kb=
    fixdel

    filetype plugin indent on
