local blocks = {}
blocks.__index = blocks
blocks.speed = 100
blocks.alt = 0
function blocks:new()
   local instance = setmetatable({},blocks)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/tile.png')
   return instance
end
function blocks:update(dt)
  blocks.alt = blocks.alt + blocks.speed * dt
end

function blocks:draw()
  --love.graphics.drawCenter(self.image,self.x,self.y)
  level1()
  level2()
  level3()
end
function level1()
  love.graphics.rectangle("fill",5,blocks.alt,100,100)
  love.graphics.rectangle("fill",696,blocks.alt,100,100)
end
function level2()
  love.graphics.rectangle("fill",50,blocks.alt-175,100,100)
  love.graphics.rectangle("fill",646,blocks.alt-175,100,100)
end
function level3()
  love.graphics.rectangle("fill",5,blocks.alt-340,200,100)
  love.graphics.rectangle("fill",696,blocks.alt-340,200,100)
end
function level4()
  love.graphics.rectangle("fill",5,blocks.alt,100,100)
  love.graphics.rectangle("fill",696,blocks.alt,100,100)
end
function level5()
  love.graphics.rectangle("fill",5,blocks.alt,100,100)
  love.graphics.rectangle("fill",696,blocks.alt,100,100)
end
function level6()
  love.graphics.rectangle("fill",5,blocks.alt,100,100)
  love.graphics.rectangle("fill",696,blocks.alt,100,100)
end
function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end
return blocks