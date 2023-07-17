local Config = require('config')
local Game = require('game')

local function isKeyDown (key) 
    return love.keyboard.isDown(key);
end

local Control = {
    inputLogic = function(dt)
        if isKeyDown("up") and Game.isPlayerNotTouchTopLimit() then
            Config.Player.posY = Config.Player.posY - Config.Paddle.speedVel * dt
        elseif isKeyDown("down") and Game.isPlayerNotTouchBottomLimit() then
            Config.Player.posY = Config.Player.posY + Config.Paddle.speedVel * dt
        end
    end
}
return Control;