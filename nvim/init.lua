Zero = {}

require('custom.symbol')
require('core.init')
require('plugins.init')
require('edge.init')

local utils = require('core.utils')
-- @param 基本配置
local options = Zero.options
utils.set_options(options)
-- @param 基本映射配置
local keymaps = Zero.keymaps
utils.set_keymaps(keymaps)

-- 初始化插件配置表
local main_plugins = {}
-- 合并插件配置
Zero.custom = require('custom.add-plugins')
vim.list_extend(main_plugins, Zero.plugins)
vim.list_extend(main_plugins, Zero.custom)

require('lazy').setup(main_plugins)
