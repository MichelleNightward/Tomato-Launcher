Enemy = class()

function Enemy:init(x)
    -- you can accept and set parameters here
end

--handle how many enemies can appear based on score
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


--add an instance of enemy to enemy table
function Enemy:create()
        if enemyCount < enemyMax then
            local enemyX = math.random(50, WIDTH-50) --randomly generate x position
            local enemyY = math.random(150, HEIGHT-50) --randomly generate y position
            local enemyNum = math.random(1,3) --randomly generate sprite
            local enemyInsult = Insults:generateInsult() --randomly generate enemy's insult
        
            enemy = {enX = enemyX,
                    enY = enemyY,
                    enemyNum = enemyNum,
                    enemyInsult = enemyInsult}
            table.insert(enemyList, enemy) --add enemy to table
            enemyCount = enemyCount + 1 -- keep track of how many enemies there are so as not to exceed max
            print "enemy test"
            
        end
end

--if tomato collides with enemy then enemy instance is removed from table
function Enemy:update()
    for k,v in pairs(enemyList) do

        if ballPos.x < (v.enX + enemyW / 2) + 10 and 
            ballPos.x > (v.enX - enemyW / 2) - 10 and 
            ballPos.y < (v.enY + enemyH / 2) + 20 and 
            ballPos.y > v.enY - enemyH / 2 then
            Ball:splatDraw(v.enX, v.enY)
            -- Remove it from the table
            enemyList[k] = nil

            enemyCount = enemyCount - 1
            score = score + 10
            ballIsMoving = false
        end
    end
    --print "update test"
end

--an enemy is drawn with one of three possible sprites
function Enemy:draw()
    textWrapWidth(85)
    if firstShot == true then
        Enemy:create()
        for k,v in pairs(enemyList) do
            sprite("Planet Cute:SpeechBubble", v.enX + 90, v.enY + 90)  
            text(v.enemyInsult, v.enX + 85, v.enY + 75)
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
