local layoutMenu

local menuItems = {
    { title = "Layouts", disabled = true },
    { title = "-" }
}

local function create ()
    layoutMenu = hs.menubar.new()
    layoutMenu:setTitle("⧉")
    layoutMenu:setTooltip("Layouts")
    layoutMenu:setMenu(menuItems)
end

return function (command, value)
    if command == "create" then create() end
    if command == "add" then table.insert(menuItems, value); layoutMenu:setMenu(menuItems) end
end