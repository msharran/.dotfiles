-- add current directory and its subdirectories to path
-- for downward file search using gf or :find
-- Very useful for navigating through a project
vim.opt.path:append("**")

-- match indication
vim.opt.showmatch = true

-- Use Ag (the_silver_searcher) for grepping
-- --hidden obeys .gitignore
vim.opt.grepprg = "ag --vimgrep --hidden"
