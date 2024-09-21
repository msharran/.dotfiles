local vim = vim
local Plug = vim.fn['plug#']

vim.cmd [[
function! s:install_plugins()
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync | q
    echom 'Plugins installed successfully, restart neovim to apply configuration changes.'
  endif
endfunction

" Run PlugInstall if there are missing plugins
autocmd VimEnter * call s:install_plugins()
]]

vim.call('plug#begin')

-- Editor
Plug 'nvim-lua/plenary.nvim' -- Lua lib used by many plugins
Plug 'tpope/vim-repeat'      -- Repeat plugin maps
Plug 'tpope/vim-surround'    -- Surround text with brackets, quotes, etc.
Plug 'tpope/vim-unimpaired'  -- Pairs of useful mappings
Plug 'numToStr/Comment.nvim' -- Comment lines

-- Notes
Plug 'vimwiki/vimwiki'
Plug('iamcco/markdown-preview.nvim', { ['do'] = ':call mkdp#util#install()', ['for'] = { 'markdown', 'vim-plug' } })

-- Looks
Plug 'nvim-tree/nvim-web-devicons' -- Icons for plugins
Plug 'folke/which-key.nvim'        -- Keybindings helper
Plug 'norcalli/nvim-colorizer.lua' -- Colorizer
Plug 'folke/todo-comments.nvim'    -- TODO, FIXME, etc. comment highlights
Plug 'folke/zen-mode.nvim'         -- Zen mode
Plug 'ibhagwan/fzf-lua'            -- FZF

-- Git plugins
Plug 'ruifm/gitlinker.nvim'    -- Open github links
Plug 'lewis6991/gitsigns.nvim' -- Git signs

-- LSP plugins
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })  -- Treesitter
Plug 'nvim-treesitter/nvim-treesitter-context'                     -- Function context
Plug 'williamboman/mason.nvim'                                     -- LSP Installer
Plug 'williamboman/mason-lspconfig.nvim'                           -- LSP Installer
Plug 'j-hui/fidget.nvim'                                           -- Loading spinner
Plug 'folke/neodev.nvim'                                           -- Nvim configs autocompletion
Plug 'fatih/vim-go'                                                -- Adds go specific features like :GoAddStructTags, :GoBuild (quickfix support)
Plug 'neovim/nvim-lspconfig'                                       -- Neovim LSP
Plug 'zbirenbaum/copilot.lua'                                      -- Github Copilot

-- Completion plugins
Plug 'hrsh7th/cmp-nvim-lsp' -- LSP completion
Plug 'hrsh7th/cmp-buffer'   -- Buffer completion
Plug 'hrsh7th/cmp-path'     -- Path completion
Plug 'hrsh7th/cmp-cmdline'  -- Command line completion
Plug 'onsails/lspkind.nvim' -- nvim-cmp pictograms
Plug 'hrsh7th/nvim-cmp'     -- Autocompletion plugin

-- Debugger
Plug 'mfussenegger/nvim-dap' -- Debugger
Plug 'leoluz/nvim-dap-go'
Plug "rcarriga/nvim-dap-ui"
Plug 'nvim-neotest/nvim-nio'

-- Kitty
Plug 'fladson/vim-kitty'

vim.call('plug#end')
