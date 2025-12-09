local ScoreSystem = {
  value = 0,
  incrementValue = 4,
  x = 350,
  y = 20,
  numberSpriteSheet = love.graphics.newImage("Sprites/numbersSheet.png")
}
ScoreSystem.__index = ScoreSystem

local line = {
  x = 400,
  y = 300,
  width = 5,
  height = 600,
  sprite = love.graphics.newImage('Sprites/line.png')
}
local player = require("Scripts/player")
local circle = require("Scripts/Circle")
local physics = require("Scripts/Physics")

local updateScore = true

function ScoreSystem:new()
  local instance = setmetatable({},ScoreSystem)
   return instance
end

function ScoreSystem:update(dt)
  increaseValue()
end

function increaseValue()
    if CheckCollision(player.x,player.y,player.width,player.height, line.x,line.y,line.width,line.height) and CheckCollision(circle.x,circle.y,circle.width,circle.height, line.x,line.y,line.width,line.height) then
      if updateScore then
        ScoreSystem.value = ScoreSystem.value + ScoreSystem.incrementValue
        updateScore = false
      end
      else
        updateScore = true
      end
  end

function boxPlayerPos(player,obj,wave)
  if (wave%2) ~= 0 then
    if player.y < obj.y and (distanceTo(player,obj) <= 3) then
      ScoreSystem.value = ScoreSystem.value + ScoreSystem.incrementValue
    end
  elseif (wave%2) == 0 then
    if player.x < obj.x then
      ScoreSystem.value = ScoreSystem.value + ScoreSystem.incrementValue
    end
  end
end
function CreateNumberRenderer(spriteSheet,digitWidth,digitHeight,scale)
  local quads = {}
  
  for i = 0, 9 do
    quads[i] = love.graphics.newQuad(
      i*digitWidth,0,
      digitWidth,digitHeight,
      spriteSheet:getDimensions()
    )
  end
  
  return function(score,x,y)
    local scoreStr = tostring(score)
    local currentX = x
    
    for i = 1,#scoreStr do
      local digit = tonumber(scoreStr:sub(i,i))
      love.graphics.draw(spriteSheet,quads[digit],currentX,y,0,scale,scale)
      currentX = currentX + digitWidth * scale
    end
  end
end

drawScore = CreateNumberRenderer(ScoreSystem.numberSpriteSheet,64,64,1)

function ScoreSystem:draw()
  --love.graphics.drawCenter(line.sprite,line.x,line.y)
  drawScore(ScoreSystem.value,ScoreSystem.x,ScoreSystem.y)
end
return ScoreSystem