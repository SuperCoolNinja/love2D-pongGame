local Config = require('config')
local Translations = require('locales/' .. Config.currentLanguage)
local Menu = require('gui')

local Game = {
    isPlayerNotTouchTopLimit = function()
        return Config.Player.posY > Config.Paddle.topLimit
    end,

    isPlayerNotTouchBottomLimit = function()
        return Config.Player.posY <= Config.Paddle.bottomLimit
    end,

    showUI = function() 
        if not Config.isPaused then
            love.graphics.setBackgroundColor(Config.GameScreen.bgColor.r, Config.GameScreen.bgColor.g, Config.GameScreen.bgColor.b)
            love.graphics.print(Translations.score, Config.Window.width / 2 - love.graphics.getFont():getWidth(Translations.score) / 2, 100)
        else 
            if not Menu.isVisible then 
                love.graphics.setBackgroundColor(Config.GameScreen.bgColorPaused.r, Config.GameScreen.bgColorPaused.g, Config.GameScreen.bgColorPaused.b)
                love.graphics.print(Translations.play, Config.Window.width / 2 - love.graphics.getFont():getWidth(Translations.play) / 2, 100)
            end
        end
    end,

    drawMenu = function()
        if Menu.isVisible then 
            local menuWidth = Config.Window.width / 1
            local menuHeight = #Menu.options * (Menu.itemHeight + Menu.spacing) 
            local menuX = (Config.Window.width - menuWidth) / 2
            local menuY = (Config.Window.height - menuHeight) / 2

            love.graphics.setColor(0, 0, 0, 0.7)
            love.graphics.rectangle("fill", menuX, menuY, menuWidth, menuHeight)

            love.graphics.setColor(1, 1, 1)
            for i, option in ipairs(Menu.options) do
                local textX = menuX + (menuWidth - Menu.itemWidth) / 2
                local textY = menuY + (i - 1) * (Menu.itemHeight + Menu.spacing) + (Menu.itemHeight - love.graphics.getFont():getHeight()) / 2

                if i == Menu.selectedItem then 
                    love.graphics.setColor(1, 1, 1)
                else
                    love.graphics.setColor(105 / 255, 105 / 255, 105 / 255)           
                end

                love.graphics.print(option.label, textX, textY)
                love.graphics.setColor(1, 1, 1)       
            end
        end
    end
}


return Game;