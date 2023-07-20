local Config = require('config')
local Translations = require('locales/' .. Config.currentLanguage)
local Menu = require('gui')

local Game = {
    showUI = function()

        -- Limit Zone UI  :
        love.graphics.setColor(1, 1, 1, 0.2)
        love.graphics.rectangle("fill", Config.LimitZoneUI.posX, Config.LimitZoneUI.posY, Config.LimitZoneUI.width, Config.LimitZoneUI.height)

        -- reset the color :
        love.graphics.setColor(1, 1, 1, 1)
       
        -- Player score : 
        love.graphics.print(tostring(Config.Player.score) , Config.Window.width / 4 - love.graphics.getFont():getWidth(tostring(Config.Player.score)) / 2, 100)
        
        -- IA score :
        love.graphics.print(tostring(Config.IA.score), Config.Window.width / 2 * 1.5 - love.graphics.getFont():getWidth(tostring(Config.IA.score)) / 2, 100)

        if (not Menu.isVisible and Config.isPaused ) then
            love.graphics.setBackgroundColor(Config.GameScreen.bgColor.r, Config.GameScreen.bgColor.g, Config.GameScreen.bgColor.b)
            love.graphics.print(Translations.play, Config.Window.width / 2 - love.graphics.getFont():getWidth(Translations.play) / 2, Config.Window.height - love.graphics.getFont():getHeight() - Config.GameScreen.padding)
        end
    end,

    drawMenu = function()
        if Menu.isVisible then
            local padding = 10
            local menuWidth = Config.Window.width
            local menuHeight = #Menu.options * (Menu.itemHeight + Menu.spacing)
            local menuX = (Config.Window.width - menuWidth) / 2
            local menuY = (Config.Window.height - menuHeight) / 2


            love.graphics.setColor(Menu.bgRect.r, Menu.bgRect.g, Menu.bgRect.b, Menu.bgRect.a) --> change the background color of the rectangle.
            love.graphics.rectangle("fill", menuX, menuY - padding, menuWidth + 0, menuHeight + padding)
            love.graphics.setColor(Menu.itemColor.r, Menu.itemColor.g, Menu.itemColor.b)


            for i, option in ipairs(Menu.options) do
                local textX = Config.Window.width / 2 - Menu.itemWidth / 2
                local textY = menuY + (i - 1) * (Menu.itemHeight + Menu.spacing) + (Menu.itemHeight - love.graphics.getFont():getHeight()) / 2

                if i == Menu.selectedItem then 
                    love.graphics.setColor(Menu.itemColor.r, Menu.itemColor.g, Menu.itemColor.b)
                else
                    love.graphics.setColor(Menu.notHoverColor.r, Menu.notHoverColor.g, Menu.notHoverColor.b)  
                end

                love.graphics.print(option.label, textX, textY)
                love.graphics.setColor(Menu.itemColor.r, Menu.itemColor.g, Menu.itemColor.b)
            end
        end
    end
}


return Game;