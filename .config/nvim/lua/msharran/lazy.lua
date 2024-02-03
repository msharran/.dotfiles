local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    { "chentoast/marks.nvim" },
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }, -- only using telescope for git worktree plugin extension. Have to replace with fzf
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { "junegunn/fzf", build = "./install --bin" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "theprimeagen/harpoon" },
    { "mbbill/undotree" },
    {
        'ruifm/gitlinker.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip', version = "v2.*" },     -- Required
        }
    },
    { "zbirenbaum/copilot.lua" },
    { 'AndreM222/copilot-lualine' },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { "fatih/vim-go" },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "christoomey/vim-tmux-navigator" },
    { "lewis6991/gitsigns.nvim" },
    { "ThePrimeagen/git-worktree.nvim" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    { "ThePrimeagen/vim-be-good" },
    { "ixru/nvim-markdown" },
    { "sotte/presenting.nvim" },
    -- themes
    { 'rose-pine/neovim', name = 'rose-pine' }
})
