---
--- Keys
---
local paw = {"cmd", "alt", "ctrl"}

---
--- Window management
---
local split = require("split")

hs.hotkey.bind(paw, "Left", function()
    split(hs.window.focusedWindow(), "left")
end)

hs.hotkey.bind(paw, "Right", function()
    split(hs.window.focusedWindow(), "right")
end)

--
-- Audio
--
local jackEventWatcher = require("jackEventWatcher")

local function volumeSetter (level, message)
    return function (device)
        device:setOutputVolume(level)
        hs.notify.show(message, string.format("Volume set to %d%%", level), device:name())
    end
end

jackEventWatcher("setConnectedCallback", volumeSetter(20, "Jack connected"))
jackEventWatcher("setDisconnectedCallback", volumeSetter(0, "Jack disconnected"))
jackEventWatcher("start")

--
-- Local-specific config
--
pcall(require, "local")

--
-- Config
--
hs.hotkey.bind(paw, "R", function()
    hs.reload()
end)

hs.notify.show("Hammerspoon config loaded", "", "")
