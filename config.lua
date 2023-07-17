local Config = 
{
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
    },
    
    IA = {
        posX = 0,
        posY = 0
    },

    Ball = {
       posX = 0,
       posY = 0,
       speedVel = 0,
       radius = 7
    },

    Window = {
        width = 0,
        height = 0,
        title = "Pong Game by SuperCoolNinja.",
    },
    
    GameScreen = {
        fontSize = 30, 
        bgColor = { 
            r = 100 / 255,
            g = 149 / 255,
            b = 237 / 255
        }
    }
}
return Config;