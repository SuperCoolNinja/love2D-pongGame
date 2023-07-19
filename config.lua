local Config = 
{
    currentLanguage = "fr", --> change here your language
    hasWindowFocus = true,
    isPaused = true,

    Paddle = {
        width = 15,
        height = 100,
        speedVel = 470.0,
        padding = 10.0,
        topLimit = 0,
        bottomLimit = 0
    },
    
    Player = {
        posX = 15,
        posY = 0,
        score = 0,
    },
    
    IA = {
        posX = 0,
        posY = 0,
        score = 0,
    },

    Ball = {
       posX = 0,
       posY = 0,
       speedVel = 0,
       radius = 7
    },

    Window = {
        title = "Pong Game by SuperCoolNinja.",
        width = nil,
        height = nil,
    },

    LimitZoneUI = {
        posX = 0,
        posY = 0,
        width = 5,
        height  = 10
    },
    
    GameScreen = {
        fontSize = 30, 

        bgColor = { 
            r = 0 / 255,
            g = 0 / 255,
            b = 0 / 255
        },
        padding = 20
    }
}
return Config;