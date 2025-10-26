local Circle =  {}
Circle.__index = Circle

Circle.x = 700
Circle.y = 500
Circle.Sprite = love.graphics.newImage('Sprites/enemyWhite.png')
local Player = require('player')
function Circle:new()
   local instance = setmetatable({},Circle)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/enemyWhite.png')
   return instance
end
function Circle:load()
   PlayerY = Player.y
end
function Circle:draw()
   love.graphics.drawCenter(self.image,self.x,self.y)
end
function Circle:update(dt)
   Circle.y = Player.y
end
function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end

return Circle