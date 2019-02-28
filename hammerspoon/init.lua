--- Keys
local claw = {"cmd", "alt", "ctrl"}

--- Window management
hs.window.animationDuration = 0

local split = require("split")

hs.hotkey.bind(claw, "Up", function()
    split(hs.window.focusedWindow(), 0, 0, 1, 1)
end)

hs.hotkey.bind(claw, "Left", function()
    split(hs.window.focusedWindow(), 0, 0, 0.5, 1)
end)

hs.hotkey.bind(claw, "Right", function()
    split(hs.window.focusedWindow(), 0.5, 0, 0.5, 1)
end)

hs.hotkey.bind(claw, "Down", function()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local bounds = win:screen():frame()

    frame.x = (bounds.w * 0.5) - (frame.w * 0.5)
    frame.y = (bounds.h * 0.5) - (frame.h * 0.5)
    win:setFrame(frame)
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
local _, err = pcall(require, "local")
if err then print(err) end

-- Config
hs.alert.defaultStyle.radius = 5
hs.alert.defaultStyle.strokeColor = { white = 0, alpha = 0 }
hs.alert.defaultStyle.textSize = 24

hs.hotkey.bind(claw, "R", function()
    hs.reload()
end)

hs.notify.show("Hammerspoon config loaded", "", "")