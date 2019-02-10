--
-- Horizontal split
--

local function split (win, side)
    local frame = win:frame()
    local bounds = win:screen():frame()
    local width = bounds.w * 0.5

    frame.x = (side == "right") and width or 0
    frame.y = bounds.y
    frame.w = width
    frame.h = bounds.h
    win:setFrame(frame)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    split(hs.window.focusedWindow(), "left")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    split(hs.window.focusedWindow(), "right")
end)

--
-- Audio
--

-- Prevent blaring audio if jack unplugged
local function headphones_disconnected(audiodevice)
    hs.notify.show("Headphones unplugged", "External speakers muted", "")
    audiodevice:setOutputMuted(true)
end

-- Start headphone volume at a safe level
local function headphones_connected(audiodevice)
    hs.notify.show("Headphones plugged", "Volume set to 20%", "")
    audiodevice:setOutputVolume(20)
end

-- Per-device watcher to detect headphones in/out
local function audiodevwatch(dev_uid, event_name, _, _)
    local device = hs.audiodevice.findDeviceByUID(dev_uid)
    if event_name == 'jack' then
        if device:jackConnected() then
            headphones_connected(device)
        else
            headphones_disconnected(device)
        end
    end
end

for _, dev in ipairs(hs.audiodevice.allOutputDevices()) do
    dev:watcherCallback(audiodevwatch):watcherStart()
end

--
-- Config
--

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")
