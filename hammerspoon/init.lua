-- Keys
local claw = {"cmd", "alt", "ctrl"}

-- Window management
hs.window.animationDuration = 0

hs.hotkey.bind(claw, "Up", function()
    hs.window.focusedWindow():moveToUnit'[0,0,100,100]'
end)

hs.hotkey.bind(claw, "Left", function()
    hs.window.focusedWindow():moveToUnit'[0,0,50,100]'
end)

hs.hotkey.bind(claw, "Right", function()
    hs.window.focusedWindow():moveToUnit'[50,0,100,100]'
end)

hs.hotkey.bind(claw, "Down", function()
    hs.window.focusedWindow():centerOnScreen()
end)

-- Launch new iTerm2 window
local function termWindow ()
    hs.osascript.applescript('tell application "iTerm" to create window with default profile')
end

-- Gnome-like terminal window shortcut
hs.hotkey.bind(claw, "T", termWindow)

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
local localLoaded, localErr = pcall(require, "local")
if not localLoaded then print(localErr) end

-- Config
hs.alert.defaultStyle.radius = 5
hs.alert.defaultStyle.strokeColor = { white = 0, alpha = 0 }
hs.alert.defaultStyle.textSize = 24

hs.hotkey.bind(claw, "R", function()
    hs.reload()
end)

local info = localLoaded and "Loaded local.lua" or "Error loading local.lua"
hs.notify.show("Hammerspoon config loaded", info, "")

hs.osascript.applescript([[
    tell application "iTerm"
        set newWindow to (create window with default profile)
        tell current session of newWindow to write text "clear; neofetch"
    end tell
]])