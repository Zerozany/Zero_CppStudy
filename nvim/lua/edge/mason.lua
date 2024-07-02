-- lua/plugins/mason.lua
-- @param mason ui
if not Zero.plugins then
    Zero.plugins = {}
end
  
table.insert(Zero.plugins, {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    -- "✓"
                    package_installed = Zero.symbols.Affirmative,
                    -- "➜"
                    package_pending = Zero.symbols.Pending,
                    -- "✗" 
                    package_uninstalled = Zero.symbols.Negative
                },
            }
        })
    end
})
  
