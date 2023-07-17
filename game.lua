local Config = require('config')

local Game = {
    isPlayerNotTouchTopLimit = function()
        return Config.Player.posY > Config.Paddle.topLimit
    end,

    isPlayerNotTouchBottomLimit = function()
        return Config.Player.posY <= Config.Paddle.bottomLimit
    end

}
return Game;