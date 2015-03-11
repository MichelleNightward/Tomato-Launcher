-- Tomato Launcher
launcherPos = vec2(WIDTH / 2, 71)
ballPos = vec2(WIDTH / 2, 71)
ballRadius = 10
ballVel = vec2(0, 7)
x2 = 0
y2 = 0
touchID = CurrentTouch.id
enemyList = {}
enemyCount = 0
enemyMax = 5
continue = false
enemyW = 80
enemyH = 80
score = 0

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
    menuVisable = true
    ballIsMoving = false
    gameStart = false
    firstShot = false
end

-- This function gets called once every frame
function draw()
    Enemy:max()
    if menuVisable == false and ballIsMoving == false then
        ballPos = vec2(WIDTH / 2, 71)
    end
    if ballPos.x == x2 and
    ballPos.y == y2 then
        ballIsMoving = false
        print "ball isnt moving"
    end
    if menuVisable then
        Menu:draw()
    elseif gameStart then
        background(138, 50, 238, 255)
        if ballIsMoving then
            Ball:move()
        end
        fill(0, 0, 0, 255)
        text("Score: "..score, WIDTH/2, HEIGHT-100)
        Launcher:draw()
        Enemy:update()
        Enemy:create()
        Enemy:draw()
    end   
end

function touched(touch)
    if touch.state ~= ENDED and menuVisable then
        menuVisable = false
        gameStart = true
    elseif touch.state == BEGAN and
    ((ballPos.x == x2 and ballPos.y == y2) or ballPos == vec2(WIDTH / 2, 71))and gameStart then
        print "touch test"
        ballIsMoving = true
        firstShot = true
        x2 = CurrentTouch.x
        y2 = CurrentTouch.y
    end
    
end