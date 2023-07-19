-- some import stuff :

local Config = require "config"
local Control = require "control"
local Game = require "game"






-- used to check if we are in debug mode : 
local lldebugger = nil
if arg[2] == "debug" then
    lldebugger = require("lldebugger").start()
end




-- This is called once when the game start :
function love.load()
    
    -- Game default settings : 
    love.graphics.setNewFont(Config.GameScreen.fontSize)
    love.window.setTitle(Config.Window.title)

    -- Get game size : 
    Config.Window.width = love.graphics.getWidth()
    Config.Window.height = love.graphics.getHeight()

    -- Setup Player : 
    Config.Player.posY = Config.Window.height/2 - Config.Paddle.height/2

    -- Setup Paddle limit zone : 
    Config.Paddle.topLimit = Config.Paddle.padding;
    Config.Paddle.bottomLimit = Config.Window.height - Config.Paddle.height - Config.Paddle.padding;

    -- Setup Ball : 
    Config.Ball.posX = Config.Window.width / 2 - Config.Ball.radius/2
    Config.Ball.posY = Config.Window.height / 2 - Config.Ball.radius / 2
end



-- This is call every frame to render thing on screen : 
function love.draw()
    -- Player : 
    love.graphics.rectangle("fill", Config.Player.posX, Config.Player.posY, Config.Paddle.width, Config.Paddle.height);
    
    -- Ball :
    love.graphics.circle("fill", Config.Ball.posX, Config.Ball.posY, Config.Ball.radius)
    
    -- Score :
    Game.showUI()

    -- Draw Menu : 
    Game.drawMenu()
end




-- This is call every frame usefull for logic like input control, game object movement ... 
function love.update(dt)

    -- Update the game focus mode :
    Config.hasWindowFocus = love.window.hasFocus();

    -- Control the input logic action : 
    Control.inputLogic(dt)
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