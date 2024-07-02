-- lua/plugins/treesitter.lua
-- @param 语言高亮
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/playground',
    },
    -- 插件的主要配置模块为 nvim-treesitter.configs
    main = 'nvim-treesitter.configs',
    -- 自动更新 nvim-treesitter 的解析器
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            -- 安装语言解析器 :TSInstall 
            ensure_installed = {
                'cpp',
                'c',
                'python',
                'lua',
                'vim',
                'json',
                'markdown',
            },
            -- 自动同步安装解析器
            sync_install = true,
            -- 开启高亮
            highlight = {
                enable = true,
            },
            -- 启用 Playground 功能，用于交互式查看代码解析树
            -- @param 代码解析树 :TSPlaygroundToggle
            playground = {
                enable = true,
            },
            -- 智能缩进
            indent = {
                enable = true,
            },
        })
    end,
})
