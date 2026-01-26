local _ = require('Scripts/Physics')
local bullet = require('Scripts/bullet')
local shoot = true
local Player = {
  x = 20,
  y = 300,
  speed = 250,
  width = 32,
  height = 32,
  sprite = love.graphics.newImage('Sprites/Player.png'),
  bullNUm = 0
}

Player.__index = Player

Player.bullets = {}
local avatar1Shoot = true

function Player:new(X,Y)
  local instance = setmetatable({},Player)
  instance.xp = X
  instance.yp = Y
  if instance.yp ~= nil and instance.xp ~= nil then
    if instance.yp > 0 and instance.xp > 0 then
      Player.x = instance.xp
      Player.y = instance.yp
    end
  end
  instance.image = love.graphics.newImage('Sprites/Player.png')
  return instance
end

function Player:draw()
  love.graphics.setColor(1,1,1,1)
  love.graphics.drawCenter(self.image,self.x,self.y)
  
  for _,bull in ipairs(Player.bullets) do
    love.graphics.drawCenter(bull.Sprite,bull.x,bull.y)
     --love.graphics.draw(bull.Sprite,bull.x,bull.y)
  end
end


function Player:update(dt)
  for i,bull in ipairs(Player.bullets) do
    bull.y = bull.y - 2
    if bull.y < 0 then
      table.remove(Player.bullets,i)
    end
  end
  if (love.keyboard.isDown("0")) then
    avatar1Shoot = false
  elseif (love.keyboard.isDown("9")) then
    avatar1Shoot = true
  end
  

  
  moveMent(dt)
  local x = Player.x
  local y = Player.y - 50
  if love.keyboard.isDown("o") and (avatar1Shoot) then
    if shoot and (Player.bullNUm < 3) then
      table.insert(Player.bullets,bullet(x,y))
      shoot = false
    end
  else
    shoot = true
  end
end


function moveMent(dt)
  if love.keyboard.isDown("e") and Player.x < 800 then
    Player.x = Player.x + Player.speed * dt
  elseif love.keyboard.isDown("q") and Player.x > 0 then
    Player.x = Player.x - Player.speed * dt
  end
   
  if love.keyboard.isDown("w") and Player.y > 0 then
    Player.y = Player.y - Player.speed * dt
  elseif love.keyboard.isDown("s") and Player.y < 600 then
    Player.y = Player.y + Player.speed * dt
  end 
end

return Player