--- Keys
local paw = {"cmd", "alt", "ctrl"}

--- Window management
local split = require("split")

hs.hotkey.bind(paw, "Up", function()
    split(hs.window.focusedWindow(), 0, 0, 1, 1)
end)

hs.hotkey.bind(paw, "Left", function()
    split(hs.window.focusedWindow(), 0, 0, 0.5, 1)
end)

hs.hotkey.bind(paw, "Right", function()
    split(hs.window.focusedWindow(), 0.5, 0, 0.5, 1)
end)

-- Gnome-like terminal new window shortcut
hs.hotkey.bind({"cmd", "ctrl"}, "T", function()
    hs.osascript.applescript('tell application "iTerm2" to create window with default profile')
end)

-- Audio
local function muteAll ()
    for _, device in ipairs(hs.audiodevice.allOutputDevices()) do
        device:setOutputVolume(0)
        hs.notify.show("All audio muted", "Audio output device change detected", "")
    end
end

local jackEventWatcher = require("jackEventWatcher")
jackEventWatcher("setConnectedCallback", muteAll)
jackEventWatcher("setDisconnectedCallback", muteAll)
jackEventWatcher("start")

local audiodeviceWatcher = require("audiodeviceWatcher")
audiodeviceWatcher("setDevCallback", muteAll)
audiodeviceWatcher("start")

-- Local-specific config
local _, err = pcall(require, "local")
if err then print(err) end

-- Config
hs.alert.defaultStyle.radius = 5
hs.alert.defaultStyle.strokeColor = { white = 0, alpha = 0 }
hs.alert.defaultStyle.textSize = 24

hs.hotkey.bind(paw, "R", function()
    hs.reload()
end)

hs.notify.show("Hammerspoon config loaded", "", "")
