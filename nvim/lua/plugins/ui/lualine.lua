-- lua/plugins/lualine.lua
-- @param 状态栏
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lualine').setup({
            options = {
                -- 启用图标
                icons_enabled = true,  
                -- 设置主题      
                theme = 'auto',        
            },
            -- nvim-tree窗口使用自适应样式
            extensions = {'nvim-tree'}
        })
        require('lualine').get_config()
    end,
})
