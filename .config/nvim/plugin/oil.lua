require("oil").setup({
  columns = {
    "icon",
    "permissions",
  },
  delete_to_trash = true,
  -- view_options = {
    -- show_hidden = true,
  -- },
})

vim.cmd [[
nnoremap - :Oil<CR>
]]
