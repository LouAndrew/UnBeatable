local blocks = {}
blocks.__index = blocks
blocks.speed = 100
blocks.altx = -200
local Value = 0
local Valuex = 0
wv = 1
function blocks:new()
   local instance = setmetatable({},blocks)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/tile.png')
   return instance
end
function blocks:update(dt)
  
  if wv == 1 then
    Value = Value + blocks.speed * dt 
  end
    
  if wv == 2 then
    Valuex = Valuex + blocks.speed * dt 
  end
  
end

function blocks:draw()
  --love.graphics.drawCenter(self.image,self.x,self.y)
  Wave1(Value)
  Wave2(Valuex)
end

function Wave1(v)
  if wv == 1 then
    level1(v);level2(v)
    level3(v);level4(v)
    if level1(v) and level2(v) and level3(v) and level4(v) then 
      wv = 2
    else 
      return true end
  end
end
function Wave2(v)
    if wv == 2 then
      level5(v)
      level6(v)
    end
end

function level1(val)
  local alt = 0
  alt = alt + val
  love.graphics.rectangle("fill",5,alt,100,100)
  love.graphics.rectangle("fill",696,alt,100,100)
  if alt > 600 then 
    return true 
  else return false end
end

function level2(val)
  local alt = -175
  alt = alt + val
  love.graphics.rectangle("fill",100,alt,100,100)
  love.graphics.rectangle("fill",596,alt,100,100)
  if alt > 600 then
    return true
  else return false end
end

function level3(val)
  local alt = -400
  alt = alt + val
  love.graphics.rectangle("fill",80,alt,200,100)
  love.graphics.rectangle("fill",510,alt,200,100)
  if alt > 600 then
    return true 
  else return false end
end

function level4(val)
  local alt = -600
  alt = alt + val
  love.graphics.rectangle("fill",5,alt,100,100)
  love.graphics.rectangle("fill",696,alt,100,100)
  if alt > 600 then
    return true 
  else return false end
end

function level5(val)
  local altx = -200
  altx = altx + val
  love.graphics.rectangle("fill",altx,200,100,100)
  love.graphics.rectangle("fill",altx,400,100,100)
  if altx <= 800 then 
    return true 
  else return false end
end
function level6(val)
  local altx = -400
  altx = altx + val
  love.graphics.rectangle("fill",altx,200,100,100)
  love.graphics.rectangle("fill",altx,400,100,100)
end

function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end

return blocks