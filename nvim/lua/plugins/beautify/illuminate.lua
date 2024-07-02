-- lua/plugins/illuminate.lua
-- @param 相同单词展示
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'RRethy/vim-illuminate',
    config = function()
        require('illuminate').configure({
            delay = 100,
            underline = true,
            providers = {
                'lsp',
                'treesitter',
            },
        })
    end,
})
