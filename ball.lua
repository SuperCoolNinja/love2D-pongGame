local Config = require('config')



local Ball = {
    generateRandomPos = function() 
        local rand = love.math.random(3)

        -- possible value of rand : 
        --[[
            1 : ball goes to the left side.
            2 : ball goes to the right side.
            3 : ball goes to diagonal side.
        ]]

        if rand == 1 then 
            Config.Ball.dirX = -1
            Config.Ball.dirY = 0
        elseif rand == 2 then 
            Config.Ball.dirX = 1
            Config.Ball.dirY = 0
        else
            Config.Ball.dirX = love.math.random(2) == 1 and -1 or 1
            Config.Ball.dirY = love.math.random(2) == 1 and -1 or 1
        end
    end,

    defaultPos = function() 
        Config.Ball.posX = Config.Window.width / 2 - Config.Ball.radius/2
        Config.Ball.posY = Config.Window.height / 2 - Config.Ball.radius / 2
    end,

    move = function(dt) 
        Config.Ball.posX = Config.Ball.posX + Config.Ball.speedVel * Config.Ball.dirX * dt
        Config.Ball.posY = Config.Ball.posY + Config.Ball.speedVel * Config.Ball.dirY * dt
   end
}

return Ball;