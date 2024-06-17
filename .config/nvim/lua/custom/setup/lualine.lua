require('lualine').setup({
    options = {
        theme = 'auto',
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        always_divide_middle = true
    },
    inactive_winbar = {
        lualine_x = { { 'filename', path = 3 } },
    },
    winbar = {
        lualine_x = { { 'filename', path = 3 } },
    },
    inactive_sections = {
        lualine_c = {}, -- disable the filename in inactive windows to show in winbar
    },
    sections = {
        -- left
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'copilot',
                symbols = {
                    status = {
                        icons = {
                            enabled = " ",
                            sleep = " ",
                            disabled = " ",
                            warning = " ",
                            unknown = " "
                        },
                        hl = {
                            enabled = "#50FA7B",
                            sleep = "#AEB7D0",
                            disabled = "#6272A4",
                            warning = "#FFB86C",
                            unknown = "#FF5555"
                        }
                    },
                    spinners = require("copilot-lualine.spinners").dots,
                    spinner_color = "#6272A4"
                },
                show_colors = true,
                show_loading = true
            },
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    extensions = { 'quickfix', 'fugitive', 'fzf' },
})
