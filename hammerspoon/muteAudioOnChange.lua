local function muteAll ()
    for _, device in ipairs(hs.audiodevice.allOutputDevices()) do
        device:setOutputVolume(0)
    end
end

hs.audiodevice.watcher.setCallback(function(value)
    if value == "dev#" then
        muteAll()
        hs.notify.show("All audio muted", "Audio output device change detected", "")
    end
end)

return function (command, value)
    if command == "start" then hs.audiodevice.watcher.start() end
end
