-- lua/plugins/nvim-tree.lua
-- @param 文件树
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- 禁用 netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- 配置 nvim-tree
        require('nvim-tree').setup({
            -- 干涉光标移动
            hijack_cursor = true,
            -- 文件修改后自动重新加载
            auto_reload_on_write = true,
            -- 视图设置
            view = {
                -- 文件树宽度
                width = 25,
                -- 高亮显示选中行
                cursorline = true,
                -- 文件树显示位置
                side = 'left',
                -- 不显示行号
                number = false,
                -- 不显示相对行号
                relativenumber = false,
                -- 显示标记列
                signcolumn = 'auto',
                -- 浮动窗口，默认关闭
                float = {
                    enable = false,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = 'editor',
                        border = 'rounded',
                        width = 50,
                        height = 15,
                        row = 3,
                        col = 30,
                    },
                },
                -- 文件类型图标及高亮
            },
            renderer = {
                -- 显示空文件夹
                group_empty = true,
                -- 控制缩进标记
                indent_markers = {
                    enable = true,
                    inline_arrows = true,
                    -- 目录展开前缀样式
                    icons = {
                        corner = '└',
                        edge = '│',
                        item = '│',
                        bottom = '─',
                        none = ' ',
                    },
                },
            },
            -- 自动跟新目录焦点
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            -- 控制 Neovim 中诊断信息的显示和设置
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                debounce_delay = 50,
                icons = {
                    hint = Zero.symbols.Hint,
                    info = Zero.symbols.Info,
                    warning = Zero.symbols.Warn,
                    error = Zero.symbols.Error,
                },
            },
            -- 文件弹出窗口时的设置选项
            actions = {
                -- 打开文件后关闭文件树
                open_file = {
                    quit_on_open = false,
                },
                -- 文件移除操作时，相关窗口会被自动关闭
                remove_file = {
                    close_window = true,
                },
                file_popup = {
                    --文件树中弹出窗口设置
                    open_win_config = {
                        -- 窗口的列位置
                        col = 1,
                        -- 窗口的行位置
                        row = 1,
                        -- 窗口相对于光标的位置
                        relative = 'cursor',
                        -- 窗口边框样式
                        -- @param shadow：阴影边框，窗口周围会有一层阴影效果
                        -- @param single：单一边框，窗口周围有一个单一的边框线
                        -- @param double：双重边框，窗口周围有两层边框线
                        -- @param rounded：圆角边框，窗口边框呈现圆角的外观
                        -- @param none：无边框，窗口没有任何边框效果
                        border = 'rounded',
                        -- 窗口的样式
                        -- @param minimal：最小化样式，窗口显示内容最少，通常只显示必要的边框和内容
                        -- @param default：默认样式，通常是一个常规的窗口显示样式
                        -- @param popup：弹出式样式，窗口呈现为一个弹出窗口，可以具有不同的视觉效果
                        -- @param dropdown：下拉式样式，窗口从上方下拉显示，类似于弹出菜单的样式
                        style = 'minimal',
                    },
                },
            },
        })
        -- 自动更新 nvim-web-devicons
        vim.cmd('autocmd VimEnter * lua require("nvim-web-devicons").setup()')
        -- 根据文件树状态打开或关闭文件树
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, nowait = false, silent = false })
    end,
})
