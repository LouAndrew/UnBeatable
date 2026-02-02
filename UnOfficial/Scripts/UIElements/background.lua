local _= require("Scripts/Physics")

local BG = {
  Sprite = love.graphics.newImage('Sprites/BackGround1.png'),
  x = 400,
  y = 300
}


function BG:new()
  local instance = setmetatable({},BG)
  return instance
end

function BG:update()
end

function BG:draw()
  love.graphics.drawCenter(BG.Sprite,BG.x,BG.y)
end

return BG