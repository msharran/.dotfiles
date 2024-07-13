local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-vividchalk')               -- Colorscheme
Plug('folke/which-key.nvim')               -- Keybindings helper
Plug('norcalli/nvim-colorizer.lua')        -- Colorizer
Plug('nvim-lua/plenary.nvim')              -- Lua lib used by many plugins
Plug('folke/todo-comments.nvim')           -- TODO, FIXME, etc. comment highlights
Plug('tpope/vim-repeat')                   -- Repeat plugin maps
Plug('tpope/vim-surround')                 -- Surround text with brackets, quotes, etc.
Plug('tpope/vim-obsession')                -- Automatic session management
Plug('tpope/vim-unimpaired')               -- Pairs of useful mappings
Plug('numToStr/Comment.nvim')              -- Comment lines
Plug('christoomey/vim-tmux-navigator')     -- Navigate between vim and tmux panes
Plug('theprimeagen/harpoon')               -- Better project wise marks

-- Git plugins
Plug('tpope/vim-fugitive')      -- Git commands
Plug('junegunn/gv.vim')         -- Git commit browser
Plug('ruifm/gitlinker.nvim')    -- Open github links
Plug('lewis6991/gitsigns.nvim') -- Git signs

-- LSP plugins
Plug('nvim-tree/nvim-web-devicons')                               -- Icons for plugins
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- Treesitter
Plug('nvim-treesitter/nvim-treesitter-context')                   -- Function context
Plug('williamboman/mason.nvim')                                   -- LSP Installer
Plug('williamboman/mason-lspconfig.nvim')                         -- LSP Installer
Plug('j-hui/fidget.nvim')                                         -- Loading spinner
Plug('folke/neodev.nvim')                                         -- Nvim configs autocompletion
Plug('fatih/vim-go')                                              -- Adds go specific features like :GoAddStructTags, :GoBuild (quickfix support)
Plug('neovim/nvim-lspconfig')                                     -- Neovim LSP
Plug('zbirenbaum/copilot.lua')                                    -- Github Copilot

-- Completion plugins
Plug('hrsh7th/cmp-nvim-lsp')                                                     -- LSP completion
Plug('hrsh7th/cmp-buffer')                                                       -- Buffer completion
Plug('hrsh7th/cmp-path')                                                         -- Path completion
Plug('hrsh7th/cmp-cmdline')                                                      -- Command line completion
Plug('onsails/lspkind.nvim')                                                     -- nvim-cmp pictograms
Plug('hrsh7th/nvim-cmp')                                                         -- Autocompletion plugin

-- Debugger
Plug('mfussenegger/nvim-dap') -- Debugger
Plug('leoluz/nvim-dap-go')
Plug("rcarriga/nvim-dap-ui")
Plug('nvim-neotest/nvim-nio')

-- Notes
Plug('vimwiki/vimwiki') -- Vimwiki

vim.call('plug#end')
