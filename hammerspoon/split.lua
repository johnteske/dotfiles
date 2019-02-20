-- Accepts normalized dimensions
return function (win, xn, yn, wn, hn)
    local frame = win:frame()
    local bounds = win:screen():frame()

    frame.x = bounds.w * xn
    frame.y = bounds.h * yn
    frame.w = bounds.w * wn
    frame.h = bounds.h * hn
    win:setFrame(frame)
end
