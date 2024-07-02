-- lua/plugins/mason-lspconfig.lua
-- @param mason-lspconfig
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",       -- C/C++ 语言服务器
                "jsonls",       -- JSON 语言服务器
                "lua_ls",       -- Lua 语言服务器
                "pyright",      -- Python 语言服务器
            },
            automatic_installation = true,
        })

    end
})
