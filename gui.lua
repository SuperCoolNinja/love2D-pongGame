
local Config = require('config')
local Translations = require('locales/' .. Config.currentLanguage)
local Ball = require('ball')
local Paddle = require('paddle')
local Menu = nil

Menu = {
    x = 0,
    y = 0,
    itemHeight = 30,
    itemWidth = 200,
    spacing = 10,

    isVisible = false,
    selectedItem = 1,

    bgRect = {r  = 1, g =  1, b =  1, a = 0.2},
    itemColor = {r  = 1, g = 1, b = 1},
    notHoverColor ={r = 105 / 255, g = 105 / 255,b = 105 / 255},


    options = {
        {
            label = Translations.resume,
            action = function() 
                Menu.isVisible = false
                Config.isPaused = false
            end
        },

        {
            label = Translations.reset,
            action = function()
                Config.isPaused = true
                Menu.isVisible = false
                Config.Player.score = 0
                Config.IA.score = 0
            
                Ball.defaultPos()
                Paddle.defaultPos()
            end
        },
    }
}




function Menu.draw()
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

return Menu;