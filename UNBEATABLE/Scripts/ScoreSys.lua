local ScoreSystem = {}
ScoreSystem.__index = ScoreSystem
ScoreSystem.x = 10
ScoreSystem.y = 10
ScoreSystem.value = 0 
ScoreSystem.incrementValue = 4
local player = require("Scripts/player")
local circle = require("Scripts/Circle")
function ScoreSystem:new()
  local instance = setmetatable({},ScoreSystem)
   instance.x = x
   instance.y = y
   return instance
end

function ScoreSystem:update(dt)
  increaseValue()
end

function increaseValue()
  if player.x >= 380 and player.x <= 382 then
    ScoreSystem.value = ScoreSystem.value + ScoreSystem.incrementValue
    end
end

function ScoreSystem:draw()
  --love.graphics.setColor(20,255,0,255)
  love.graphics.print(ScoreSystem.value,ScoreSystem.x,ScoreSystem.y)
end
return ScoreSystem