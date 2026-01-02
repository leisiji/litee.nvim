local commands = require("litee.lib.commands")
local config = require("litee.lib.config").config
local lib_hi = require("litee.lib.highlights")
local lib_icons = require("litee.lib.icons")

local M = {}

-- Once set up, `M.icon_set` must be a non-nil table.
M.icon_set = nil

local function icon_set()
    local tree = config.tree
    local base = lib_icons[tree.icon_set] or lib_icons["default"]
    local icons = nil
    if tree.icon_set_custom ~= nil then
        icons = tree.icon_set_custom
        -- merge custom icon with the default
        for key, _ in pairs(base) do
            icons[key] = icons[key] or base[key]
        end
    else
        icons = base
    end
    M.icon_set = icons
end

-- If a custom icon_set (table) is provided by the user,
-- `M.icon_set` will be updated and returned.
-- A user can use the icons from `lib_icons`
-- via providing a key name instead of a custom icon_set (table).
-- When both arguments are provided, the custom icon_set is merged
-- with the icons given by its name from `lib_icons`.
function M.icon_set_update(custom, icon_key)
    local icons = nil
    if custom ~= nil then
        icons = icon_key and lib_icons[icon_key] or M.icon_set
        for key, _ in pairs(custom) do
            icons[key] = custom[key]
        end
    else
        icons = lib_icons[icon_key] or lib_icons["default"]
    end
    return icons
end

local function merge_subconfig(component, user_subconfig)
    local subconfig = config[component]
    if subconfig == nil then
        return
    end

    for key, val in pairs(user_subconfig) do
        subconfig[key] = val
    end
end

function M.setup(user_config)
    if user_config ~= nil then
        for component, user_subconfig in pairs(user_config) do
            merge_subconfig(component, user_subconfig)
        end
    end

    -- setup icon_set
    icon_set()

    -- setup default highlights
    lib_hi.setup_default_highlights()

    -- setup commands
    commands.setup()

    -- au to close popup with cursor moves or buffer is closed.
    vim.cmd("au CursorMoved,BufWinLeave,WinLeave * lua require('litee.lib.util.buffer').close_all_popups()")

    -- on resize cycle the panel to re-adjust window sizes.
    vim.cmd("au VimResized * lua require('litee.lib.panel.autocmds').on_resize()")

    -- will clean out any tree data for a tab when closed. only necessary
    vim.cmd([[au TabClosed * lua require('litee.lib.state.autocmds').on_tab_closed(vim.fn.expand('<afile>'))]])
end

return M
