" General {
    set nocompatible        " Must be first line

    " Install provided the plugins
    if filereadable(expand("~/.vimrc.plug"))
      source ~/.vimrc.plug " vim-plug
    endif

    syntax enable               " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing

    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore                         " Allow for cursor beyond last character
    set history=100
    set hidden                                      " Allow buffer switching without saving

    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    set ruler                                          " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                                        " Show partial commands in status line and

    " Broken down into easily includeable segments
    set statusline=%<%f\                    " Filename
    set statusline+=%w%h%m%r                " Options
    set statusline+=\ [%{&ff}/%Y]           " Filetype
    set statusline+=\ [%{getcwd()}]         " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
    set laststatus=2                        " Always show the status line

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
    set encoding=utf-8                             " Encoding

    " Fix backspace and delete
    set t_kb=
    fixdel
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

    " Delete trailing spaces
    noremap <leader>s :%s/\s\+$//e <CR>

    " Change into directory of the current file
    noremap <leader>dir :cd %:p:h <CR>

    " Copy fullpath of file into "f
    noremap <leader>path :let @f = expand('%:p')<CR>

    " Toggle paste mode
    noremap <leader>tp :set paste!<CR>

    " Insert unicode box
    noremap <leader>box i<C-v>u2610<Esc>

    " Replace with a checkbox
    noremap <leader>check <Esc>r<C-v>u2611<Esc>

    " Toggle expand tab
    noremap <leader>tt :set expandtab!<CR>
" }

    " Colorscheme (default - but plugin can override)
    colorscheme desert

    " Create the backup directory
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

   " Load file type specific settings
    filetype plugin indent on

    " Load plugin specific configuration
    if filereadable(expand("~/.vimrc.plugins"))
      source ~/.vimrc.plugins
    endif
