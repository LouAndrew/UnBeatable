local level = require("levels/level1")
function love.load()
  font = love.graphics.newFont("fonts/Tsuchigumo.ttf",60)
  level = level.new()
end

function love.update(dt)
  if not love.keyboard.isDown("p") then
    level:update(dt)
  end
end

function love.draw()
  level:draw()
end
--A project by Louis Andrew (GODTIER)