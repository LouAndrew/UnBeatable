local Player = {}

Player.__index = Player
Player.x = 20
Player.y = 300
Player.speed = 250
Player.width = 26
Player.height = 26
Player.sprite = love.graphics.newImage('Sprites/Player.png')
Player.moveLeft = true
Player.moveRight = true
Player.moveUp = true
Player.moveDown = true
local collisions = require('AllCollisions')
function Player:new()
  local instance = setmetatable({},Player)
  instance.x = x
  instance.y = y
  instance.image = love.graphics.newImage('Sprites/Player.png')
  instance.bullets = {}
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
  moveMent(dt)
  pullEffect(Player,dt)
  --Colliding(Player,bull)
end
function pullEffect(object,dt)
  if Pull == true then 
    local gravity = 50
    if fR == true then object.x = object.x + gravity * dt end
    if fL == true then object.x = object.x - gravity * dt end
    if fU == true then object.y = object.y - gravity * dt end
    if fD == true then object.y = object.y + gravity * dt end
  end
end
function moveMent(dt)
  if love.keyboard.isDown("e") and Player.x < 800 and Player.moveRight == true then
    Player.x = Player.x + Player.speed * dt
  elseif love.keyboard.isDown("q") and Player.x > 0 and Player.moveLeft == true then
    Player.x = Player.x - Player.speed * dt
  end
   
  if love.keyboard.isDown("w") and Player.y > 0 and Player.moveUp == true then
    Player.y = Player.y - Player.speed * dt
  elseif love.keyboard.isDown("s") and Player.y < 600 and Player.moveDown == true then
    Player.y = Player.y + Player.speed * dt
  end 
end

return Player