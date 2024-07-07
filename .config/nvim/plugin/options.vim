set number
set relativenumber
set tabstop=4 " TODO: revisit this
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap 
set noswapfile 
set nobackup 
set undofile 
set hlsearch 
set incsearch 
set ignorecase 
set termguicolors 
set signcolumn=yes
set isfname+="@-@"
set updatetime=50
set colorcolumn=80
set timeout
set timeoutlen=300

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
augroup END

" Add current directory and its subdirectories to path
" for downward file search using gf or :find
" Very useful for navigating through a project
set path+=**

" match indication
set showmatch

" Use Ag (the_silver_searcher) as grepprg
set grepprg=ag\ --vimgrep\ --hidden
