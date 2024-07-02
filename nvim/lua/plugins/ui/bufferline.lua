-- lua/plugins/bufferline.lua
-- @param bufferline
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'akinsho/bufferline.nvim',
    dependencies = {
        'moll/vim-bbye',
        'nvim-tree/nvim-web-devicons',
    },
    version = '*',
    config = function()
        require('bufferline').setup({
            options = {
                -- 设置关闭缓冲区的命令
                close_command = 'Bdelete! %d',
                -- 设置右键关闭缓存区标签
                right_mouse_command = 'Bdelete! %d',
                -- 设置中键单击缓冲区标签的命令
                middle_mouse_command = nil,
                -- 以随着 Neovim 主题的变化而变化
                themable = true,
                -- 设置是否在标签上显示诊断信息,
                -- @param false（不显示诊断信息）
                -- @param "nvim_lsp"（使用 Neovim 内置的 LSP 诊断）
                -- @param "coc"（使用 coc.nvim 插件的诊断）
                diagnostics = 'nvim_lsp',
                -- 如果设置为 false，插入模式下不会更新诊断信息，只有在退出插入模式后才会更新
                diagnostics_update_in_insert = fasle,
                -- 标签显示诊断图标
                diagnostics_indicator = function(_, _, diagnostics_dict, _)
                    local s = ' '
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == 'error' and Zero.symbols.Error
                            or (e == 'warning' and Zero.symbols.Warn or Zero.symbols.Info)
                        s = s .. n .. sym
                    end
                    return s
                end,
                -- 设置标签的显示样式
                indicator = {
                    -- 指示器的图标
                    icon = '',
                    -- 指示器的显示样式，可以是 'icon'、'underline' 或 'none'
                    style = 'underline',
                },
                -- 侧边栏配置
                offsets = {
                    {
                        filetype = 'NvimTree',
                        -- 文件树缓冲标签名称
                        text = ' File Explorer ',
                        highlight = 'Directory',
                        -- "left" | "center" | "right"
                        text_align = 'center',
                    },
                },
                -- 鼠标监听事件
                hover = {
                    enabled = true,
                    delay = 50,
                    reveal = { 'close' },
                },
                -- 将 numbers 函数移到 options 中
                numbers = function(opts)
                    return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
                end,
            },
        })
        -- 左右窗口切换
        vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>', { noremap = true, nowait = false, silent = false })
        vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>', { noremap = true, nowait = false, silent = false })
        -- 关闭
        vim.keymap.set('n', '<C-w>', ':Bdelete!<CR>', { noremap = true, nowait = false, silent = false })
    end,
})
