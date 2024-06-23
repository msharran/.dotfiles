local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/seoul256.vim') -- Colorscheme 
Plug('folke/which-key.nvim') -- Keybindings helper
Plug('chentoast/marks.nvim') -- Marks helper
Plug('norcalli/nvim-colorizer.lua') -- Colorizer
Plug('MeanderingProgrammer/markdown.nvim') -- Markdown preview
Plug('nvim-lua/plenary.nvim') -- Lua lib used by many plugins
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- FZF bindings for telescope
Plug('folke/todo-comments.nvim') -- TODO, FIXME, etc. comment highlights
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' }) -- Fuzzy finder
Plug('tpope/vim-repeat') -- Repeat plugin maps
Plug('tpope/vim-surround') -- Surround text with brackets, quotes, etc.
Plug('tpope/vim-unimpaired') -- Pairs of useful mappings
Plug('numToStr/Comment.nvim') -- Comment lines
Plug('christoomey/vim-tmux-navigator') -- Navigate between vim and tmux panes
Plug('theprimeagen/harpoon')

-- Git plugins
Plug('tpope/vim-fugitive')
Plug('ruifm/gitlinker.nvim')
Plug('lewis6991/gitsigns.nvim')

-- LSP plugins
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug( 'nvim-treesitter/nvim-treesitter-context')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('j-hui/fidget.nvim')
Plug('folke/neodev.nvim') -- Nvim configs autocompletion
Plug('fatih/vim-go') -- Adds go specific features like :GoAddStructTags, :GoBuild (quickfix support)
Plug('neovim/nvim-lspconfig')
Plug('zbirenbaum/copilot.lua')

-- Completion plugins
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('rafamadriz/friendly-snippets')                     -- Friendly Snippets have sane defaults for a lot of languages
Plug('L3MON4D3/LuaSnip', { ['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})
Plug('saadparwaiz1/cmp_luasnip')
Plug('onsails/lspkind.nvim') -- nvim-cmp pictograms
Plug('hrsh7th/nvim-cmp')

vim.call('plug#end')
