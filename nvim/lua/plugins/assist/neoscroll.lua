-- lua/plugins/neoscroll.lua
-- @param 平滑滚动插件
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup {
            -- 自定义按键映射，默认为空
            mappings = {},
            -- 滚动时隐藏光标
            hide_cursor = true,
            -- 在文件末尾停止滚动
            stop_eof = true,
            -- 是否遵循 'scrolloff' 设置
            respect_scrolloff = false,
            -- 光标是否单独滚动
            cursor_scrolls_alone = true,
            -- 平滑滚动的缓动函数，这里使用的是正弦函数
            easing_function = 'sine',
            -- 滚动前的钩子函数，默认为空
            pre_hook = nil,
            -- 滚动后的钩子函数，默认为空
            post_hook = nil,
            -- 性能模式，默认为关闭
            performance_mode = false,
        }
        -- 自定义按键设置
        require('neoscroll.config').set_mappings {
            ['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } },
            ['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } },
        }
    end,
})
