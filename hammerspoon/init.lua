--- Keys
local paw = {"cmd", "alt", "ctrl"}

--- Window management
local split = require("split")

hs.hotkey.bind(paw, "Left", function()
    split(hs.window.focusedWindow(), "left")
end)

hs.hotkey.bind(paw, "Right", function()
    split(hs.window.focusedWindow(), "right")
end)

-- Audio
local muteAudioOnChange = require("muteAudioOnChange")
muteAudioOnChange("start")

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
