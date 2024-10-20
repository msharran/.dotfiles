require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.cmd [[
nnoremap <Leader>ee :NvimTreeFindFileToggle<CR>
nnoremap <Leader>e= :NvimTreeResize +5<CR>
nnoremap <Leader>e- :NvimTreeResize -5<CR>
]]
