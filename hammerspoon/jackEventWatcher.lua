local function connectedCallback() end
local function disconnectedCallback() end

local function audiodeviceWatch(dev_uid, event_name, _, _)
    local device = hs.audiodevice.findDeviceByUID(dev_uid)
    if event_name == 'jack' then
        if device:jackConnected() then
            connectedCallback(device)
        else
            disconnectedCallback(device)
        end
    end
end

local function start ()
    for _, dev in ipairs(hs.audiodevice.allOutputDevices()) do
        dev:watcherCallback(audiodeviceWatch):watcherStart()
    end
end

return function (command, value)
    if command == "start" then start() end
    if command == "setConnectedCallback" then connectedCallback = value end
    if command == "setDisconnectedCallback" then disconnectedCallback = value end
end
