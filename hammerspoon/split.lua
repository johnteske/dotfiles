--
-- Horizontal split
--
return function (win, side)
    local frame = win:frame()
    local bounds = win:screen():frame()
    local width = bounds.w * 0.5

    frame.x = (side == "right") and width or 0
    frame.y = bounds.y
    frame.w = width
    frame.h = bounds.h
    win:setFrame(frame)
end
