local Circle =  {
  x = 780,
  y = 300,
  width = 32,
  height = 32,
  speed = 0 ,
  sprite = love.graphics.newImage('Sprites/enemyWhite.png'),
  bullNUm = 0
}
Circle.__index = Circle

Circle.bullets = {}

local player = require('Scripts/gameObjects/player')
local _ = require('Scripts/Physics')
local bullet = require('Scripts/gameObjects/bullet')
local avatar2Shoot = false

function Circle:new()
   local instance = setmetatable({},Circle)
   local x
   local y
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/enemyWhite.png')
   return instance
end

function Circle:draw()
   love.graphics.drawCenter(self.image,self.x,self.y)
   for _,bull in ipairs(Circle.bullets) do
    love.graphics.drawCenter(bull.Sprite,bull.x,bull.y)
     --love.graphics.draw(bull.Sprite,bull.x,bull.y)
  end
end

local shoot = true

function Circle:update(dt)
  if (love.keyboard.isDown("9")) then
    avatar2Shoot = false
  elseif (love.keyboard.isDown("0")) then
    avatar2Shoot = true
  end
  
  for i,bull in ipairs(Circle.bullets) do
    bull.y = bull.y + 2
    if bull.y > 600  then
      table.remove(Circle.bullets,i)
    end
  end
  local x = Circle.x
  local y = Circle.y + 50
  if love.keyboard.isDown("o") and (avatar2Shoot) then
    if shoot and (Circle.bullNUm < 3)then
      table.insert(Circle.bullets,bullet(x,y))
      shoot = false
    end
  else
    shoot = true
  end
  
  Circle.speed = player.speed
  CirclemoveMent(dt)
end

function CirclemoveMent(dt)
  if love.keyboard.isDown("e") and Circle.x > 0 then
    Circle.x = Circle.x - Circle.speed * dt
  elseif love.keyboard.isDown("q") and Circle.x < 800 then
    Circle.x = Circle.x + Circle.speed * dt
  end
  
  if love.keyboard.isDown("w") and Circle.y < 600  then
    Circle.y = Circle.y + Circle.speed * dt
  elseif love.keyboard.isDown("s") and Circle.y > 0 then
    Circle.y = Circle.y - Circle.speed * dt
  end 
end

return Circle