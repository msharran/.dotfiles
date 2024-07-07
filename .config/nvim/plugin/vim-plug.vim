function! s:install_plugins()
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync | q
    echom 'Plugins installed successfully, restart neovim to apply configuration changes.'
  endif
endfunction

" Run PlugInstall if there are missing plugins
autocmd VimEnter * call s:install_plugins()
