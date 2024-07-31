local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Git plugins
Plug('tpope/vim-fugitive')      -- Git commands
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

vim.call('plug#end')
