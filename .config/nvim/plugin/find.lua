-- add current directory and its subdirectories to path
-- for downward file search using gf or :find
-- Very useful for navigating through a project
vim.opt.path:append("**")

-- match indication
vim.opt.showmatch = true

-- Use ripgrep for grepping
vim.opt.grepprg = "rg --hidden --vimgrep --glob '!{.git,node_modules}/*'" -- Setting rg as grepprg
