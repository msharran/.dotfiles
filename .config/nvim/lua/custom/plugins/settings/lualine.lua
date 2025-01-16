require('lualine').setup({
    options = {
        theme = 'rose-pine',
        disabled_filetypes = { 'ctrlp' },
    },
    tabline = {
        lualine_a = { { 'buffers', mode = 4 } },
        lualine_z = { 'tabs' }
    },
})
