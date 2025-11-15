local ScoreSystem = {}
ScoreSystem.__index = ScoreSystem
ScoreSystem.value = 0 
ScoreSystem.incrementValue = 4
local player = require("Scripts/player")
local circle = require("Scripts/Circle")
local physics = require("Scripts/Physics")
local line = {
  x = 400,
  y = 300,
  width = 5,
  height = 600,
  sprite = love.graphics.newImage('Sprites/line.png')
}

function ScoreSystem:new()
  local instance = setmetatable({},ScoreSystem)
   return instance
end

function ScoreSystem:update(dt)
  increaseValue()
end

function increaseValue()
  
  if CheckCollision(player.x,player.y,player.width,player.height, line.x,line.y,line.width,line.height) and CheckCollision(circle.x,circle.y,circle.width,circle.height, line.x,line.y,line.width,line.height) then
    ScoreSystem.value = ScoreSystem.value + ScoreSystem.incrementValue
  end
  
end

function ScoreSystem:draw()
  --love.graphics.setColor(20,255,0,255)
  love.graphics.drawCenter(line.sprite,line.x,line.y)
  love.graphics.print(ScoreSystem.value,ScoreSystem.x,ScoreSystem.y)
end
return ScoreSystem