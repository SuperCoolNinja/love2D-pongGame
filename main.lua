-- some import stuff :

local Config = require "config"
local Control = require "control"





-- used to check if we are in debug mode : 
local lldebugger = nil
if arg[2] == "debug" then
    lldebugger = require("lldebugger").start()
end




-- This is called once when the game start :
function love.load()
    
    -- Game default settings : 
    love.graphics.setNewFont(Config.GameScreen.fontSize)
    love.graphics.setBackgroundColor(Config.GameScreen.bgColor.r, Config.GameScreen.bgColor.g, Config.GameScreen.bgColor.b)
    love.window.setTitle(Config.Window.title)

    -- Get game size : 
    Config.Window.width = love.graphics.getWidth()
    Config.Window.height = love.graphics.getHeight()

    -- Setup Player : 
    Config.Player.posY = Config.Window.height/2 - Config.Paddle.height/2
end



-- This is call every frame to render thing on screen : 
function love.draw()
    love.graphics.rectangle("fill", Config.Player.posX, Config.Player.posY, Config.Paddle.width, Config.Paddle.height);
    love.graphics.print("Score 0", Config.Window.width / 2 - love.graphics.getFont():getWidth("Score 0") / 2, 100)
end




-- This is call every frame usefull for logic like input control, game object movement ... 
function love.update(dt)

    -- Update the game focus mode :
    Config.hasWindowFocus = love.window.hasFocus();

    -- Control the input logic action : 
    Control.inputLogic()
end


















-- > used to show off error on debug mode :
local love_errorhandler = love.errhand
function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end