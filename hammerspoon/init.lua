require("split")
require("jackEventWatcher")

--
-- Config
--

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")
