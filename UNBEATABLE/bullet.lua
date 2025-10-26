local Bullet = {}
Bullet.__index = Bullet

Bullet.x = 300
Bullet.y = 300
Bullet.speed = 1
Bullet.width = 20
Bullet.height = -2
Bullet.sprite = love.graphics.newImage('Sprites/RedBullet.png')
function Bullet:new()
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
   love.graphics.drawCenter(self.image, self.x, self.y)

end
function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end
function BulletMovement()
   Bullet.x = Bullet.x - Bullet.speed
end
return Bullet