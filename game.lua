local Config = require('config')
local Translations = require('locales/' .. Config.currentLanguage)
local Menu = require('gui')

local Game = {}

function Game.showUI()
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
end

return Game;