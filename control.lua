local Config = require('config')
local Paddle = require('paddle')
local Menu = require('gui')
local Ball = require('ball')



local function isKeyDown (key) 
    return love.keyboard.isDown(key);
end

function love.keypressed(key, scancode, isrepeat)

    if key == "escape" then
        Menu.isVisible = not Menu.isVisible
        Config.isPaused = Menu.isVisible
    end

    if Menu.isVisible then
        if key ==  "return" then
            local selectedOption = Menu.options[Menu.selectedItem]
            if selectedOption and selectedOption.action then
                selectedOption.action()
            end
        end

        if key == "up" then
            Menu.selectedItem = Menu.selectedItem - 1
            if Menu.selectedItem < 1 then
                Menu.selectedItem = #Menu.options
            end
        elseif key == "down" then
            Menu.selectedItem = Menu.selectedItem + 1
            if Menu.selectedItem > #Menu.options then
                Menu.selectedItem = 1
            end
        end
    end
end

local Control = {}
function Control.inputLogic(dt)
    if not Config.isPaused then
        if (isKeyDown("up") or isKeyDown("z") or isKeyDown("w")) and Paddle.isNotTouchTopLimit(Config.Player.posY) then
            Config.Player.posY = Config.Player.posY - Config.Paddle.speedVel * dt
        elseif (isKeyDown("down") or isKeyDown("s")) and Paddle.isNotTouchBottomLimit(Config.Player.posY) then
            Config.Player.posY = Config.Player.posY + Config.Paddle.speedVel * dt
        end
    else
        if isKeyDown("space") then
            Config.isPaused = not Config.isPaused
            Ball.generateRandomPos()
        end
    end
end

return Control;
