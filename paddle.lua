local Config = require('config')

local Paddle = {}

function Paddle.isNotTouchTopLimit(targetPosY)
    return targetPosY > Config.Paddle.topLimit
end

function Paddle.isNotTouchBottomLimit(targetPosY) 
    return targetPosY <= Config.Paddle.bottomLimit
end

function Paddle.defaultPos()
    local paddingX = 15
    Config.Player.posX = paddingX
    Config.Player.posY = Config.Window.height /2 - Config.Paddle.height/2

    Config.IA.posX = (Config.Window.width - paddingX) - Config.Paddle.width
    Config.IA.posY = Config.Window.height /2 - Config.Paddle.height /2
end

function Paddle.onCollisionEnter()
    local ballHeight = Config.Ball.posY + Config.Ball.radius

    -- Check player CollisionEnter : 
    if Config.Ball.posX <= Config.Player.posX + Config.Paddle.width then 
        local paddleHeight = Config.Player.posY + Config.Paddle.height

        -- Check if the ball touches the player's paddle : 
        if ballHeight > Config.Player.posY and Config.Ball.posY < paddleHeight then
            Config.Ball.dirX = -Config.Ball.dirX
            Config.Ball.dirY = math.random() * 2 - 1 -- Random value between -1 and 1
        end
    end

    -- Check IA CollisionEnter : 
    if Config.Ball.posX + Config.Ball.radius >= Config.IA.posX then 
        local paddleHeight = Config.IA.posY + Config.Paddle.height

        if ballHeight > Config.IA.posY and Config.Ball.posY < paddleHeight then
            Config.Ball.dirX = -Config.Ball.dirX
            Config.Ball.dirY = math.random() * 2 - 1 -- Random value between -1 and 1
        end
    end
end



function Paddle.move(dt)
    local ballHeight = Config.Ball.posY + Config.Ball.radius

    -- Move IA vertically based on the ball position:
    if Config.Ball.posX > Config.Window.width / 2 and Config.Ball.dirX > 0 then
        if ballHeight > Config.IA.posY + Config.Paddle.height then 
            -- Move down
            if Paddle.isNotTouchBottomLimit(Config.IA.posY) then
                Config.IA.posY = Config.IA.posY + Config.Paddle.speedVel / 1.2 * dt
            end
        elseif ballHeight < Config.IA.posY + Config.Paddle.height / 2 then 
            -- Move up
            if Paddle.isNotTouchTopLimit(Config.IA.posY) then
                Config.IA.posY = Config.IA.posY - Config.Paddle.speedVel / 1.2 * dt
            end
        end
    end
end





return Paddle;