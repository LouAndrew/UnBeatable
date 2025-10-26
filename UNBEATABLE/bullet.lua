local Bullet = {}
Bullet.__index = Bullet

Bullet.x = 100
Bullet.y = 100
Bullet.speed = 40
Bullet.sprite = love.graphics.newImage('Sprites/RedBullet.png')
local Player = require("player")
function Bullet:new(x,y)
   local instance = setmetatable({},Bullet)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/RedBullet.png')
   return instance
end
function Bullet:update(dt)
   BulletMovement()
end
function Bullet:draw()
   Player:love.graphics.drawCenter(self.image, self.x, self.y)
end
function BulletMovement()
   Bullet.x = bullet.x - bullet.speed
end
return Bullet