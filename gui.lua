
local Config = require('config')
local Translations = require('locales/' .. Config.currentLanguage)

local Menu = nil

local function onResume()
    Menu.isVisible = false
    Config.isPaused = false
end

local function onReset()
    Config.isPaused = true
end

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
            action = onResume
        },

        {
            label = Translations.reset,
            action = onReset
        },
    }
}
return Menu;