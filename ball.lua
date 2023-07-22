local Config = require('config')
local Paddle = require('paddle')


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
    -- Calculate the velocity for the current frame
    local velocityX = Config.Ball.speedVel * Config.Ball.dirX * dt
    local velocityY = Config.Ball.speedVel * Config.Ball.dirY * dt

    -- Move the ball
    Config.Ball.posX = Config.Ball.posX + velocityX
    Config.Ball.posY = Config.Ball.posY + velocityY

    -- Check for collisions with the window borders and randomize the direction if needed
    if Config.Ball.posY < 0 or Config.Ball.posY > Config.Window.height - Config.Ball.radius then
        Config.Ball.dirY = -Config.Ball.dirY
    end

    local rightEndZone = Config.Window.width - Config.Ball.radius
    local leftEndZone = 0

    if Config.Ball.posX < leftEndZone or Config.Ball.posX > rightEndZone then
        Ball.handleScore()
    end
end

function Ball.handleScore()
    local rightEndZone = Config.Window.width - Config.Ball.radius
    local leftEndZone = 0

    if Config.Ball.posX < leftEndZone then
        Config.IA.score = Config.IA.score + 1
    elseif Config.Ball.posX > rightEndZone then
        Config.Player.score = Config.Player.score + 1
    end


    Config.isPaused = true
    Ball.defaultPos()
    Paddle.defaultPos()
end

return Ball;