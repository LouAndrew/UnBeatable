local level = {}
level.__index = level
local Blocks = require("Scripts/blocks")
local ScoreSys = require("Scripts/ScoreSys")
local Player = require("Scripts/player")
local Circle = require("Scripts/Circle")
local physics = require("Scripts/Physics")

local background = {
  x = 400,
  y = 300,
  sprite = love.graphics.newImage('Sprites/BackGround1.png')
}


function level:new()
   local instance = setmetatable({},level)
   blocks = Blocks.new()
   scoresystem = ScoreSys.new()
   player = Player.new()
   circle = Circle.new()
   return instance
end
function level:update(dt)
  player:update(dt)
  circle:update(dt)
  blocks:update(dt)
  scoresystem:update(dt)
end

function level:draw()
  love.graphics.drawCenter(background.sprite,background.x,background.y)
  scoresystem:draw()
  blocks:draw()
  player:draw()
  circle:draw()
end
return level