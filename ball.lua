local Config = require('config')

local Ball = {}

function Ball.generateRandomPos()
    local rand = love.math.random(3)

    -- Possible values of rand:
    -- 1: ball goes to the left side.
    -- 2: ball goes to the right side.
    -- 3: ball goes diagonally.
    
    if rand == 1 then
        Config.Ball.dirX = -1
        Config.Ball.dirY = 0
    elseif rand == 2 then
        Config.Ball.dirX = 1
        Config.Ball.dirY = 0
    else
        -- Randomly choose between -1 and 1 for both X and Y directions
        Config.Ball.dirX = love.math.random(0, 1) == 0 and -1 or 1
        Config.Ball.dirY = love.math.random(0, 1) == 0 and -1 or 1
    end
end

function Ball.defaultPos()
    Config.Ball.posX = Config.Window.width / 2 - Config.Ball.radius / 2
    Config.Ball.posY = Config.Window.height / 2 - Config.Ball.radius / 2
end

function Ball.move(dt)
    Config.Ball.posX = Config.Ball.posX + Config.Ball.speedVel * Config.Ball.dirX * dt
    Config.Ball.posY = Config.Ball.posY + Config.Ball.speedVel * Config.Ball.dirY * dt

    -- Check for collisions with the window borders and randomize the direction if needed
    if Config.Ball.posX < 0 or Config.Ball.posX > Config.Window.width - Config.Ball.radius then
        Config.Ball.dirX = -Config.Ball.dirX
    end

    if Config.Ball.posY < 0 or Config.Ball.posY > Config.Window.height - Config.Ball.radius then
        Config.Ball.dirY = -Config.Ball.dirY
    end
end

return Ball;