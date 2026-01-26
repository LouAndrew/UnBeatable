local level = require("Scripts/level")
function love.load()
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