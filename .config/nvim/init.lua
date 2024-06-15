vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "custom/plugins" }, {
    change_detection = {
        notify = false,
    },
})

-- Personal notes:
--
-- Anything in `plugin/` is loaded by nvim, so we don't need to do anything here
--
-- Anything in `after/` is loaded after nvim has loaded everything. This is where
-- we can override settings from plugins. For example, `after/plugin/telescope.lua`
--
-- Anything in `lua/` should be custom loaded. For example, `lua/custom` module
-- can be loaded by `require("custom")`. This will run `lua/custom/init.lua`
