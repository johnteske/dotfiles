local noop = function () end

-- State
local states = {}
states["normal"] = { tooltip = "Normal mode", title = " △ ", fn = noop, next = "focused" }
states["focused"] = { tooltip = "Focused mode", title = " ▽ ", fn = noop, next = "normal" }

local currentState = "normal"

local function nextState ()
    currentState = states[currentState].next
end

local function runStateCallback()
    states[currentState].fn()
end

-- Menubar
local focusMenu

local function setTitle ()
    focusMenu:setTitle(states[currentState].title)
    focusMenu:setTooltip(states[currentState].tooltip)
end

local function handleClick ()
    nextState()
    runStateCallback()
    setTitle()
end

local function create ()
    focusMenu = hs.menubar.new()
    focusMenu:setClickCallback(handleClick)
    setTitle()
end

return function (command, state, value)
    if command == "create" then create() end
    if command == "setCallback" then states[state].fn = value end
end
