local Player = require("player")
local Circle = require("Circle")
local Blocks = require("blocks")
local ScoreSys = require("ScoreSys")
local MainMenu = require("MainMenu")
num = 0
function love.load()
  scoresystem = ScoreSys.new()
  player = Player.new()
  circle = Circle.new()
  blocks = Blocks.new()
  mainmenu = MainMenu.new()
end
function love.update(dt)
  if not love.keyboard.isDown("p") then
    player:update(dt)
    circle:update(dt)
    blocks:update(dt)
    scoresystem:update(dt)
  end
  --Colliding(player,tile)
end
function love.draw()
  mainmenu:draw()
  player:draw()
  circle:draw()
  blocks:draw()
  scoresystem:draw()
end
--A project by Louis Andrew (GODTIER)