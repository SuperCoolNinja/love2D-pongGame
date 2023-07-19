local Config = require('config')
local Game = require('game')
local Menu = require('gui')

local function isKeyDown (key) 
    return love.keyboard.isDown(key);
end

local prevEscapeState = false
function love.keypressed(key, scancode, isrepeat)
    prevEscapeState = love.keyboard.isDown("escape")

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

local Control = {
        inputLogic = function(dt)

            if not Config.isPaused then
                if isKeyDown("up") or isKeyDown("z") or isKeyDown("w") and Game.isPlayerNotTouchTopLimit() then
                    Config.Player.posY = Config.Player.posY - Config.Paddle.speedVel * dt
                elseif isKeyDown("down") or isKeyDown("s") and Game.isPlayerNotTouchBottomLimit() then
                    Config.Player.posY = Config.Player.posY + Config.Paddle.speedVel * dt
                end
            else
                if isKeyDown("space") then
                    Config.isPaused = not Config.isPaused
                end
            end
        end
    }
    
    return Control;
    