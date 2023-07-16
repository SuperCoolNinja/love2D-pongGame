local Config = 
{
    hasWindowFocus = true,

    Paddle = {
        width = 15,
        height = 100,
        speedVel = 2.5
    },
    
    Player = {
        posX = 15,
        posY = 0,
    },
    
    IA = {
        posX = 0,
        posY = 0
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