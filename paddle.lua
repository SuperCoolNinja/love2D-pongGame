local Config = require('config')

local Paddle = {
    isNotTouchTopLimit = function(targetPosY)
        return targetPosY > Config.Paddle.topLimit
    end,

    isNotTouchBottomLimit = function(targetPosY)
        return targetPosY <= Config.Paddle.bottomLimit
    end,

    defaultPos = function() 
        Config.Player.posX = 15
        Config.Player.posY = Config.Window.height/2 - Config.Paddle.height/2
    end
}

return Paddle;