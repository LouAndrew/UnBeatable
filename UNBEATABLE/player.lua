local Player = {}

Player.__index = Player
fR = false;fL = false;fU = false;fD = false;Pull = true
Player.x = 5
Player.y = 5
Player.speed = 100
Player.width = 27
Player.height = 27
Player.sprite = love.graphics.newImage('Sprites/Player.png')

local bull = require('bullet')

function Player:new()
   local instance = setmetatable({},Player)
   instance.x = x
   instance.y = y
   instance.image = love.graphics.newImage('Sprites/Player.png')
   instance.bullets = {}
   return instance
end

function Player:load()
   bullet = bull.new()
   bullet.y = Player.y
end

function Player:draw()
   love.graphics.drawCenter(self.image,self.x,self.y)
   for i = 0, bullet in ipairs(self.bullets) do
       bullet:draw() end
end

function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end

function Player:update(dt)
    if Colliding(bull) then 
      print("ye")  end
   for i = self.bullets,1,-1 do
      self.bullets[i]:update(dt)
	  if self.bullets[i].y < 0 then
	  table.remove(self.bullets,i) end
	end
   moveMent(dt)
   pullEffect(Player,dt)
end
function Player:fire()
   local bullet = Bullet:new()
   table.insert(self.bullets,bullet) end
function pullEffect(object,dt)
   if Pull == true then 
      local gravity = 50
      if fR == true then object.x = object.x + gravity * dt end
      if fL == true then object.x = object.x - gravity * dt end
      if fU == true then object.y = object.y - gravity * dt end
      if fD == true then object.y = object.y + gravity * dt end
   end
end

function Colliding(obj2)
   if Player.x + Player.width > obj2.x and
      Player.x < obj2.x + obj2.width and
	  Player.y + Player.height > obj2.y and
	  Player.y < obj2.y + obj2.height then Player.x = Player.x;Player.y = Player.y return true
	end
end
function moveMent(dt)
   if love.keyboard.isDown("e") then
      fR = true; fL = false; fU = false
      fD = false; Player.x = Player.x + Player.speed * dt
   elseif love.keyboard.isDown("q") then
      fL = true; fR = false; fU = false;
      fD = false; Player.x = Player.x - Player.speed * dt
   end
   if love.keyboard.isDown("w") then
      fU = true; fR = false; fL = false
      fD = false; Player.y = Player.y - Player.speed * dt
   elseif love.keyboard.isDown("s") then
      fD = true; fR = false; fL = false
      fU = false; Player.y = Player.y + Player.speed * dt
   end 
 end
return Player