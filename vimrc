" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
"Enable pluginloading through pathogen
execute pathogen#infect()  
syntax on
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
colorscheme monokai " defin colorscheme 
set nu " enable Linenubers
set tabstop=4 " set tabs as 4 spaces
set shiftwidth=4 " convert tabs to 4 spaces
set expandtab   " keep it 4 spaces
set cursorline  " highlight current line
set laststatus=2 "show statusbar
" map custom keys
map <Leader>n <plug>NERDTreeTabsToggle<CR>
