local Player = {}
Player.__index = Player

fR = false;fL = false;fU = false;fD = false;Pull = true
Player.x = 0
Player.y = 0
Player.speed = 3.5
Player.sprite = love.graphics.newImage('Sprites/Player.png')

function Player:new(x,y)
   local instance = setmetatable({},Player)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/Player.png')
   return instance
end
function Player:draw()
   love.graphics.drawCenter(self.image,self.x,self.y)
end
function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end
function Player:update(dt)
   if player.y < 0 or player.x < 0 then repostion(player) 
   elseif player.y > 600 or player.x > 800 then repostion(player) 
   end
   moveMent()
   pullEffect(Player)
end

function pullEffect(object)
   if Pull == true then 
      local gravity = 0.5
      if fR == true then object.x = object.x + gravity end
      if fL == true then object.x = object.x - gravity end
      if fU == true then object.y = object.y - gravity end
      if fD == true then object.y = object.y + gravity end
   end
end
function repostion(Item)
   Item.x = 0;Item.y = 0 
end
function moveMent()
   if love.keyboard.isDown("e") then
      fR = true; fL = false; fU = false
      fD = false; Player.x = Player.x + Player.speed
   elseif love.keyboard.isDown("q") then
      fL = true; fR = false; fU = false;
      fD = false; Player.x = Player.x - Player.speed
   end
   if love.keyboard.isDown("w") then
      fU = true; fR = false; fL = false
      fD = false; Player.y = Player.y - Player.speed
   elseif love.keyboard.isDown("s") then
      fD = true; fR = false; fL = false
      fU = false; Player.y = Player.y + Player.speed
   end 
 end
return Player