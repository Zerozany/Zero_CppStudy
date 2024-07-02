-- lua/plugins/tokyonight.lua
-- @param 主题
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'folke/tokyonight.nvim',
    dependencies = {
        -- 查询icon `:NvimWebDeviconsHiTest`
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            style = 'moon',
            -- 使主题支持透明
            transparent = false,
            -- 为终端设置主题
            terminal_colors = true,
            styles = {
                -- @param Keywords：关键词（如 if、else、for）
                -- @param Comments：注释
                -- @param Functions：函数名称
                -- @param Variables：变量名称
                -- @param Strings：字符串
                -- @param Numbers：数字
                -- @param Constants：常量
                -- @param Operators：运算符
                -- @param Types：数据类型（如 int、float）
                -- @param Preprocessor：预处理器指令（如 #define、#include）
                -- @param Builtins：内置函数或变量
                -- @param Attributes：属性（如 C++ 中的 __attribute__）

                -- @param italic = true：斜体
                -- @param bold = true：粗体
                -- @param underline = true：下划线
                -- @param strikethrough = true：删除线
                -- @param reverse = true：反转前景和背景颜色
                -- @param standout = true：突出显示（通常是反转视频）
                -- @param nocombine = true：不合并样式（仅在特定情况下使用）

                -- 设置关键词为斜体
                keywords = { italic = true },
                -- 设置注释为斜体
                comments = { italic = true },
                -- 设置函数名称为粗体
                functions = { bold = true },
                -- 设置变量名称为下划线
                variables = { underline = false },
                -- @param Background styles. Can be "dark", "transparent" or "normal"
                -- 使侧栏背景透明
                sidebars = 'normal',
                -- 使浮动窗口背景透明
                floats = 'normal',
            },
            -- 将一些特殊类型的窗口标记为侧边栏
            sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
            -- 隐藏不活动的状态栏
            hide_inactive_statusline = true,
            -- 非活动窗口变暗
            dim_inactive = false,
            -- 状态栏字体变为粗体(装载lualine可设置为false)
            lualine_bold = false,
            on_colors = function(colors)
                -- 将提示颜色设置为橙色
                colors.hint = '#ff8800' 
                -- 将错误颜色设置为红色
                colors.error = '#ff0000' 
                -- 将警告颜色设置为黄色
                colors.warning = '#ffff00' 
            end,
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
})
