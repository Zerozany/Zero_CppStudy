-- lua/plugins/todo-comments
-- @param todo-comments
if not Zero.plugins then
    Zero.plugins = {}
end

-- TODO: hilight-settings
table.insert(Zero.plugins, {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- 下一个 TODO
        vim.keymap.set('n', ']t', function()
            require('todo-comments').jump_next()
        end, { desc = 'Next todo comment' })

        -- 上一个 TODO
        vim.keymap.set('n', '[t', function()
            require('todo-comments').jump_prev()
        end, { desc = 'Previous todo comment' })

        vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Previous todo comment' })
        require('todo-comments').setup({
            keywords = {
                TODO = { icon = Zero.symbols.Affirmative, color = 'info' },
                FIX = { icon = Zero.symbols.Diagnostic, color = 'error' },
                -- HACK = { icon = Zero.symbols.Hack, color = 'warning' },
                WARN = { icon = Zero.symbols.Warn, color = 'warning', alt = { 'WARNING', 'XXX' } },
                -- 性能相关的注释
                -- PERF = { icon = Zero.symbols.Performance, color = 'default' },
                -- 注意事项或提醒
                -- NOTE = { icon = Zero.symbols.Return, color = 'hint', alt = { 'INFO' } },
            },
            highlight = {
                -- 关键字前面的字符使用前景色高亮('fg'、'bg'、'')
                before = '',
                -- 关键字及其周围字符使用背景色高亮
                keyword = 'wide',
                -- 关键字后面的字符使用前景色高亮
                after = '',
                -- 仅在注释中匹配关键字
                comments_only = true,
                -- 不排除任何文件类型
                exclude = {},
            },
        })
    end,
})
