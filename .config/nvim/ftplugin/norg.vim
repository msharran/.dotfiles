inoremap <buffer> <C-j> <Plug>(neorg.itero.next-iteration)

"c = calendar
nnoremap <buffer> <localleader>cd <Plug>(neorg.tempus.insert-date) 

"z = zoom
nnoremap <buffer> <localleader>zc <Plug>(neorg.looking-glass.magnify-code-block) 

"l = list
nnoremap <buffer> <localleader>lt <Plug>(neorg.pivot.list.toggle)
nnoremap <buffer> <localleader>li <Plug>(neorg.pivot.list.invert)

"t = task
nnoremap <buffer> <localleader>ta <Plug>(neorg.qol.todo-items.todo.task-ambiguous) 
nnoremap <buffer> <localleader>td <Plug>(neorg.qol.todo-items.todo.task-done)
nnoremap <buffer> <localleader>th <Plug>(neorg.qol.todo-items.todo.task-on-hold)
nnoremap <buffer> <localleader>ti <Plug>(neorg.qol.todo-items.todo.task-important)
nnoremap <buffer> <localleader>tp <Plug>(neorg.qol.todo-items.todo.task-pending)
nnoremap <buffer> <localleader>tr <Plug>(neorg.qol.todo-items.todo.task-recurring)

nnoremap <buffer> >> <Plug>(neorg.promo.promote.nested)
nnoremap <buffer> >. <Plug>(neorg.promo.promote)
nnoremap <buffer> << <Plug>(neorg.promo.demote.nested)
nnoremap <buffer> <. <Plug>(neorg.promo.demote)
vnoremap <buffer> < <Plug>(neorg.promo.demote.range)
vnoremap <buffer> > <Plug>(neorg.promo.promote.range)

nnoremap <buffer> <C-v> <Plug>(neorg.esupports.hop.hop-link.vsplit)

nnoremap <buffer> [h <Plug>(neorg.treesitter.previous.heading)
nnoremap <buffer> ]h <Plug>(neorg.treesitter.next.heading)

nnoremap <buffer> [l <Plug>(neorg.treesitter.previous.link)
nnoremap <buffer> ]l <Plug>(neorg.treesitter.next.link)
