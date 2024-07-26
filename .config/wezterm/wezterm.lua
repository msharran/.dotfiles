--- wezterm.lua
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- My Wezterm config file

local wezterm = require("wezterm")
local act = wezterm.action

local fish_path = "/opt/homebrew/bin/fish"

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.default_prog = { fish_path, "-l" }

config.color_scheme = "Tokyo Night"
config.font_size = 14
config.font = wezterm.font_with_fallback({
    { family = "SauceCodePro Nerd Font", },
    { family = "CaskaydiaCove Nerd Font", },
})
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000

-- Keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    -- Send C-a when pressing C-a twice
    { key = "a",          mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },
    { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },
    { key = "phys:Space", mods = "LEADER",      action = act.ActivateCommandPalette },

    -- Pane keybindings
    { key = "s",          mods = "LEADER",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "v",          mods = "LEADER",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "h",          mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
    { key = "j",          mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
    { key = "k",          mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
    { key = "l",          mods = "LEADER",      action = act.ActivatePaneDirection("Right") },
    { key = "q",          mods = "LEADER",      action = act.CloseCurrentPane { confirm = true } },
    { key = "z",          mods = "LEADER",      action = act.TogglePaneZoomState },
    { key = "o",          mods = "LEADER",      action = act.RotatePanes "Clockwise" },
    -- We can make separate keybindings for resizing panes
    -- But Wezterm offers custom "mode" in the name of "KeyTable"
    { key = "r",          mods = "LEADER",      action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },

    -- Tab keybindings
    { key = "t",          mods = "LEADER",      action = act.SpawnTab("CurrentPaneDomain") },
    { key = "[",          mods = "LEADER",      action = act.ActivateTabRelative(-1) },
    { key = "]",          mods = "LEADER",      action = act.ActivateTabRelative(1) },
    { key = "n",          mods = "LEADER",      action = act.ShowTabNavigator },
    {
        key = "e",
        mods = "LEADER",
        action = act.PromptInputLine {
            description = wezterm.format {
                { Attribute = { Intensity = "Bold" } },
                { Foreground = { AnsiColor = "Fuchsia" } },
                { Text = "Renaming Tab Title...:" },
            },
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end)
        }
    },
    -- Key table for moving tabs around
    { key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },
    -- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
    { key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
    { key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

    {
        key = 'w',
        mods = 'LEADER',
        action = wezterm.action_callback(function(window, pane)
            -- Here you can dynamically construct a longer list if needed

            local home = wezterm.home_dir
            local workspaces = {
                { id = home,                     label = 'Home' },
                { id = home .. '/projects/work', label = 'Work' },
                { id = home .. '/projects/play', label = 'Play' },
                { id = home .. '/.dotfiles',     label = 'Config' },
            }

            local handle = assert(io.popen("fd --hidden -td -d 3 --ignore . " .. home .. "/projects"))
            local allFileNames = string.split(assert(handle:read('*a')), '\n')
            wezterm.log_info("::::",allFileNames[1]) -- This will print the first file name
            window:perform_action(
                act.InputSelector {
                    action = wezterm.action_callback(
                        function(inner_window, inner_pane, id, label)
                            if not id and not label then
                                wezterm.log_info 'cancelled'
                            else
                                wezterm.log_info('id = ' .. id)
                                wezterm.log_info('label = ' .. label)
                                inner_window:perform_action(
                                    act.SwitchToWorkspace {
                                        name = label,
                                        spawn = {
                                            label = 'Workspace: ' .. label,
                                            cwd = id,
                                        },
                                    },
                                    inner_pane
                                )
                            end
                        end
                    ),
                    title = 'Choose Workspace',
                    choices = workspaces,
                    fuzzy = true,
                    fuzzy_description = 'Fuzzy find and/or make a workspace',
                },
                pane
            )
        end),
    },

}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = act.ActivateTab(i - 1)
    })
end

config.key_tables = {
    resize_pane = {
        { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
        { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
        { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
        { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
        { key = "Escape", action = "PopKeyTable" },
        { key = "Enter",  action = "PopKeyTable" },
    },
    move_tab = {
        { key = "h",      action = act.MoveTabRelative(-1) },
        { key = "j",      action = act.MoveTabRelative(-1) },
        { key = "k",      action = act.MoveTabRelative(1) },
        { key = "l",      action = act.MoveTabRelative(1) },
        { key = "Escape", action = "PopKeyTable" },
        { key = "Enter",  action = "PopKeyTable" },
    }
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
-- config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false
wezterm.on("update-status", function(window, pane)
    local basename = function(s)
        -- Nothing a little regex can't fix
        return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end

    -- Current working directory
    local cwd = pane:get_current_working_dir()
    if cwd then
        if type(cwd) == "userdata" then
            -- Wezterm introduced the URL object in 20240127-113634-bbcac864
            cwd = basename(cwd.file_path)
        else
            -- 20230712-072601-f4abf8fd or earlier version
            cwd = basename(cwd)
        end
    else
        cwd = ""
    end

    -- Right status
    window:set_right_status(wezterm.format({
        -- Wezterm has a built-in nerd fonts
        -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
        { Text = "  " .. cwd .. "  " },
    }))
end)

return config
