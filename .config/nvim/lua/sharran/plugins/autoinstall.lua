vim.cmd [[
" == Auto Install on VimEnter ==
function! s:install_plugins()
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync | q
    echom 'Plugins installed successfully, restart Neovim.'
  endif
endfunction

autocmd VimEnter * call s:install_plugins()
]]

-- NOTE: This is present here since I couldn't find a way to 
-- import a vimscript file in init.vim
