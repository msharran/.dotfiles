-- " Run PlugInstall if there are missing plugins
-- autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
--   \| PlugInstall --sync | source $MYVIMRC
-- \| endif

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('vim_plug_installer', {}),
    desc = 'Install plugins automatically on startup',
    pattern = '*',
    callback = function()
        if vim.fn.len(vim.fn.filter(vim.fn.values(vim.g.plugs), '!isdirectory(v:val.dir)')) > 0 then
            vim.cmd('PlugInstall --sync | q')
            vim.print('Plugins installed successfully, restart neovim to apply any configuration changes.')
        end
    end,
})
