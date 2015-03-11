Menu = class()

function Menu:draw()
    background(239, 50, 50, 255)

    -- This sets the line thickness
    strokeWidth(5) 

    sprite("Project:Title",WIDTH/2, HEIGHT/1.5)
    
    --text("placeholder title",WIDTH/2, HEIGHT/1.5)
    
    sprite("Project:Subtitle", WIDTH/2, HEIGHT/3)
    
end
