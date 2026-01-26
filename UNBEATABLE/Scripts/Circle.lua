local Circle =  {
  x = 780,
  y = 300,
  width = 26,
  height = 26,
  speed = 0 ,
  moveLeft = true,
  moveRight = true,
  moveUp = true,
  moveDown = true,
  Sprite = love.graphics.newImage('Sprites/enemyWhite.png')
}
Circle.__index = Circle

love.graphics.print("hello",Circle.x,Circle.y)
local player = require('Scripts/player')
local collisions = require('Scripts/Physics')


function Circle:new()
   local instance = setmetatable({},Circle)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/enemyWhite.png')
   return instance
end
function Circle:draw()
   love.graphics.drawCenter(self.image,self.x,self.y)
end
function Circle:update(dt)
  Circle.speed = player.speed
  CirclemoveMent(dt)
end
function CirclemoveMent(dt)
  if love.keyboard.isDown("e") and Circle.x > 0 and Circle.moveLeft == true then
    Circle.x = Circle.x - Circle.speed * dt
  elseif love.keyboard.isDown("q") and Circle.x < 800 and Circle.moveRight == true then
    Circle.x = Circle.x + Circle.speed * dt
  end
  
  if love.keyboard.isDown("w") and Circle.y < 600 and Circle.moveDown == true then
    Circle.y = Circle.y + Circle.speed * dt
  elseif love.keyboard.isDown("s") and Circle.y > 0 and  Circle.moveUp == true then
    Circle.y = Circle.y - Circle.speed * dt
  end 
end

return Circle