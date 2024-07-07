" vim.api.nvim_create_autocmd('TextYankPost', {
"     group = vim.api.nvim_create_augroup('highlight_yank', {}),
"     desc = 'Hightlight selection on yank',
"     pattern = '*',
"     callback = function()
"         vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
"     end,
" })


set guicursor
set number
set relativenumber
set tabstop=4 " TODO: revisit this
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap 
set swapfile 
set backup 
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

nmap Q :noh<CR>
map <F1> <NOP>
map <F1> :echo "hello"<CR>
