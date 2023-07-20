-- some import stuff :

local Config = require "config"
local Control = require "control"
local Game = require "game"
local Paddle = require "paddle"
local Ball = require 'ball'
local Menu = require('gui')



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
    Paddle.defaultPos()

    -- Setup Paddle limit zone : 
    Config.Paddle.topLimit = Config.Paddle.padding;
    Config.Paddle.bottomLimit = Config.Window.height - Config.Paddle.height - Config.Paddle.padding;

    -- Setup Ball : 
    Ball.defaultPos()

    -- Setup Limit Zone UI : 
    Config.LimitZoneUI.posX = Config.Window.width / 2 - Config.LimitZoneUI.width /2 
    Config.LimitZoneUI.posY = 0
    Config.LimitZoneUI.height = Config.Window.height
end



-- This is call every frame to render thing on screen : 
function love.draw()

    -- Score :
    Game.showUI()

    -- Player : 
    love.graphics.rectangle("fill", Config.Player.posX, Config.Player.posY, Config.Paddle.width, Config.Paddle.height);
    
    -- Ball :
    love.graphics.circle("fill", Config.Ball.posX, Config.Ball.posY, Config.Ball.radius)

    -- Draw Menu : 
    Game.drawMenu()
end




-- This is call every frame usefull for logic like input control, game object movement ... 
function love.update(dt)

    -- Update the game focus mode :
    Config.hasWindowFocus = love.window.hasFocus();

    -- Control the input logic action : 
    Control.inputLogic(dt)

    -- Check if the window lost focus then we show the pause menu :
    if not Config.hasWindowFocus then
        Config.isPaused = true
        Menu.isVisible = true
    end

    if not Config.isPaused and not Menu.isVisible then
        -- Check for collision : 
        Paddle.onCollisionEnter()
        
        -- Update the velocity of the ball :
        Ball.move(dt)
    end
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