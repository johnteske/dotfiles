require("split")

--
-- Audio
--

local jackEventWatcher = require("jackEventWatcher")

local function volumeSetter (level, message)
    return function (device)
        device:setOutputVolume(level)
        hs.notify.show(message, string.format("Volume set to %d%%", level), "")
    end
end

jackEventWatcher("setConnectedCallback", volumeSetter(20, "Headphones connected"))
jackEventWatcher("setDisconnectedCallback", volumeSetter(0, "Headphones disconnected"))
jackEventWatcher("start")

--
-- Config
--

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)

hs.alert.show("Config loaded")
