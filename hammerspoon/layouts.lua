local layoutMenu

local function closeAll ()
    for _, app in ipairs(hs.application.runningApplications()) do
        -- kill all apps that exist in the dock
        if app:kind() == 1 then app:kill() end
    end
end

local preMenuItems = {
    { title = "Layouts", disabled = true },
    { title = "-" }
}

local menuItems = {}

local postMenuItems = {
    { title = "-" },
    { title = "Close all", fn = closeAll }
}

local function create ()
    layoutMenu = hs.menubar.new()
    layoutMenu:setTitle("⧉")
    layoutMenu:setTooltip("Layouts")
    layoutMenu:setMenu(menuItems)
end

local function copy (t, target)
    local c = target or {}
    for _, item in ipairs(t) do c[#c + 1] = item end
    return c
end

local function cat (a, b)
    local c = copy(a)
    return copy(b, c)
end

local function setMenu ()
    local t = cat({}, preMenuItems)
    t = cat(t, menuItems)
    t = cat(t, postMenuItems)

    layoutMenu:setMenu(t)
end

return function (command, value)
    if command == "create" then create() end
    if command == "add" then table.insert(menuItems, value); setMenu() end
end