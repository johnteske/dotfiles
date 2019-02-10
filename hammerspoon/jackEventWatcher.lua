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
local function audiodeviceWatch(dev_uid, event_name, _, _)
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
    dev:watcherCallback(audiodeviceWatch):watcherStart()
end
