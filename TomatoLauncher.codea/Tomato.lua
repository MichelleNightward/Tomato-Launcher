----------------
-- Ball Class --
----------------

Ball = class()

function Ball:setup()
    
end

function Ball:draw()
    fill(253, 255, 0, 255)
    noStroke()
    --ellipse(ballPos.x, ballPos.y, 2 * ballRadius)  
    sprite("Documents:Tomato", ballPos.x, ballPos.y) 
    
end

function Ball:splatDraw(x,y)
    sprite("Project:tomatoSplat", x, y)
end

function Ball:move()
    local ball = Ball:draw()
    tween( 0.5, ballPos, {x = x2, y = y2} )
end