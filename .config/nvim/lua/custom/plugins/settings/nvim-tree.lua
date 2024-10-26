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
"   w - wider
"   n - narrower
nnoremap <Leader>ew :NvimTreeResize +10<CR>
nnoremap <Leader>en :NvimTreeResize -10<CR>
]]
