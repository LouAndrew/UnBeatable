local Circle =  {}
Circle.__index = Circle

Circle.x = 780
Circle.y = 300
Circle.speed = 200
Circle.moveLeft = true
Circle.moveRight = true
Circle.moveUp = true
Circle.moveDown = true
Circle.Sprite = love.graphics.newImage('Sprites/enemyWhite.png')
local Player = require('player')
local collisions = require('AllCollisions')
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
  CirclemoveMent(dt)
  --Colliding(Circle,bull)
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

function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end

return Circle