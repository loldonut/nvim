require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_seperators = { left = ' ', right = ' ' },
        section_seperators = { left = ' ', right = ' ' },
        globalstatus = true
    },
    sections = {
        lualine_a = { {
            'buffers',
        } },
    },
}
