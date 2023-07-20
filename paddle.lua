local Config = require('config')

local Paddle = {}

function Paddle.isNotTouchTopLimit(targetPosY)
    return targetPosY > Config.Paddle.topLimit
end

function Paddle.isNotTouchBottomLimit(targetPosY) 
    return targetPosY <= Config.Paddle.bottomLimit
end

function Paddle.defaultPos()
    Config.Player.posX = 15
    Config.Player.posY = Config.Window.height/2 - Config.Paddle.height/2
end

function Paddle.onCollisionEnter()

    -- Check player CollisionEnter : 
    if Config.Ball.posX <= Config.Player.posX + Config.Paddle.width then 
        local ballHeight = Config.Ball.posY + Config.Ball.radius
        local paddleHeight = Config.Player.posY + Config.Paddle.height

        -- Check if the ball touch the top of the paddle : 
        if ballHeight > Config.Player.posY and Config.Ball.posY < paddleHeight then 
           Config.Ball.dirX = -Config.Ball.dirX
        end
    end

    -- Check IA CollisionEnter : [TODO]
end


return Paddle;