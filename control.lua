local function isKeyDown (key) 
    return love.keyboard.isDown(key);
end

local Control = {
    inputLogic = function()
        if isKeyDown("right") then
            print("RIGHT")
        elseif isKeyDown("left") then
            print("LEFT")
        elseif isKeyDown("up") then
            print("TOP")
        elseif isKeyDown("down") then
            print("BOTTOM")
        end
    end
}
return Control;