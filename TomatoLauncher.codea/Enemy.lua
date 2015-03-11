Enemy = class()

function Enemy:init(x)
    -- you can accept and set parameters here
    --self.enemyList = {}
end

function Enemy:max()
    if score < 100 then 
        enemyMax = 5
    elseif score > 100 and score < 250 then
        enemyMax = 6
    elseif score > 250 and score < 500 then
        enemyMax = 7
    elseif score > 500 and score < 800 then
        enemyMax = 8
    elseif score > 800 and score < 1200 then
        enemyMax = 9
    elseif score > 1200 and score < 1600 then
        enemyMax = 10
    else
        enemyMax = 11
    end
end

function Enemy:wait(continue, wait)
    continue = false
    waitTime = wait
    local timeTo = os.time() + 1
    while os.time() < timeTo do wait = wait - 1 end
    if wait == 0 then 
        continue = true
    end
    return continue
end



function Enemy:create()
    --if create then
        if enemyCount < enemyMax then
    -- Make sure we don't emit more than maxbubbles
            local enemyX = math.random(50, WIDTH-50)
            local enemyY = math.random(150, HEIGHT-50)
            local enemyNum = math.random(1,3)
        
            enemy = {enX = enemyX,
                    enY = enemyY,
                    enemyNum = enemyNum}
            table.insert(enemyList, enemy)
            enemyCount = enemyCount + 1
            print "enemy test"
            
        end
    --end
    --Enemy:wait(create,3)
end

function Enemy:update()
    -- Loop through bubbles
    for k,v in pairs(enemyList) do

        if ballPos.x < (v.enX + enemyW / 2) + 10 and 
            ballPos.x > (v.enX - enemyW / 2) - 10 and 
            ballPos.y < (v.enY + enemyH / 2) + 20 and 
            ballPos.y > v.enY - enemyH / 2 then
            Ball:splatDraw(v.enX, v.enY)
            -- Remove it from the table
            enemyList[k] = nil
            
            -- Reduce our bubble count
            --  (we can emit more now!)
            enemyCount = enemyCount - 1
            score = score + 10
            ballIsMoving = false
        end
    end
    --print "update test"
end

function Enemy:draw()
    if firstShot == true then
        Enemy:create()
        for k,v in pairs(enemyList) do
            if v.enemyNum == 1 then
                sprite("Project:Enemy1",v.enX,v.enY)
            elseif v.enemyNum == 2 then
                sprite("Project:Enemy2",v.enX,v.enY)
            elseif v.enemyNum == 3 then
                sprite("Project:Enemy3",v.enX,v.enY)
            end
        end
    end
end


function Enemy:touched(touch)
    -- Codea does not automatically call this method
end
