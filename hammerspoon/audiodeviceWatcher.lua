local function devCallback() end

local function start ()
    hs.audiodevice.watcher.setCallback(function(value)
        if value == "dev#" then
            devCallback()
        end
    end)
end

return function (command, value)
    if command == "start" then start() end
    if command == "setDevCallback" then devCallback = value end
end
