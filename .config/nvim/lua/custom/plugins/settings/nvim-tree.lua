require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.cmd [[
nnoremap <Leader>ec :NvimTreeClose<CR>
nnoremap <Leader>ee :NvimTreeFindFile<CR>
" Resize
nnoremap <Leader>el :NvimTreeResize +10<CR>
nnoremap <Leader>eh :NvimTreeResize -10<CR>
]]
