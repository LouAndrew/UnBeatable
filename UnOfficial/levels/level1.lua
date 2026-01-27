local level = {}

level.__index = level
local Blocks = require("Scripts/gameObjects/blocks")
local Player = require("Scripts/gameObjects/player")
local Circle = require("Scripts/gameObjects/Circle")
local inGameUI = require("Scripts/InGameUI")
local _= require("Scripts/Physics")

local background = {
  x = 400,
  y = 300,
  sprite = love.graphics.newImage('Sprites/BackGround1.png')
}
local entities = {}

function level:new()
   local instance = setmetatable({},level)
   Player = Player.new()
   Circle = Circle.new()
   inGameUI = inGameUI.new()
   return instance
end

local pbull1 = 0
local pbull2 = 1
local xp = 50
local yp = 0

local blockStatic = false
local shoot = true

local avatars = {
  Player,
  Circle
}

function level:update(dt)
  Player:update(dt)
  Circle:update(dt)
  inGameUI:update(dt)
  
  while (pbull2 <= 2) do
    while (pbull1 <= 3) do
      table.insert(entities,Blocks(xp,yp))
      pbull1 = pbull1 + 1
      xp = xp + 200
    end
    xp = 50
    yp = -200
    pbull1 = 0
    pbull2 = pbull2 + 1
  end
  if (blockStatic == false) then
    for _,obj in ipairs(entities) do
      if obj.y > 650 then
        obj.y = -40
      else
        obj.y = obj.y + 30 * dt
      end
    end
    for i,ava in ipairs(avatars) do
      if (i == 1) and (inGameUI.shootp1) then
        for _,ent in ipairs(entities) do
          if CheckCollision(ava.x,ava.y,ava.width,ava.height,ent.x,ent.y,ent.width,ent.height) then
            blockStatic = true
            table.remove(inGameUI.hearts,#inGameUI.hearts)
          end
        end 
      elseif (i == 2) and (inGameUI.shootp2) then
        for _,ent in ipairs(entities) do
          if CheckCollision(ava.x,ava.y,ava.width,ava.height,ent.x,ent.y,ent.width,ent.height) then
            blockStatic = true
            table.remove(inGameUI.hearts,#inGameUI.hearts)
          end
        end 
      end
    end
  end
  
  if (blockStatic) then
    if ((Player.x < 10) or (Player.x > 790)) and love.keyboard.isDown("r") then
      blockStatic = false 
    end
  end
  
  for i in ipairs(Player.bullets)do
    for ii,obj in ipairs(entities) do
      if Player.bullets[i] ~= nil then
        if checkDistanceTo(obj,Player.bullets,i) then
          inGameUI:increaseScore()
          table.remove(entities,ii)
          table.remove(Player.bullets,i)
        end
      end
    end
  end
  for i in ipairs(Circle.bullets)do
    for ii,obj in ipairs(entities) do
       if Circle.bullets[i] ~= nil then
        if checkDistanceTo(obj,Circle.bullets,i) then
          inGameUI:increaseScore()
          table.remove(entities,ii)
          table.remove(Circle.bullets,i)
        end
      end
    end
  end
end

function level:draw()
  love.graphics.drawCenter(background.sprite,background.x,background.y)
  
  for _,entity in ipairs(entities) do
    love.graphics.draw(entity.Sprite,entity.x,entity.y)
  end
  
  Player:draw()
  Circle:draw()
  inGameUI:draw()
  --love.graphics.draw(love.graphics.newImage('Sprites/panel1.png'),10,20)
end

function checkDistanceTo(obj1,obj2,i)
  if distanceTo(obj1,obj2[i]) <= 100 then
    if CheckCollision(obj1.x,obj1.y,obj1.width,obj1.height, obj2[i].x,obj2[i].y,obj2[i].width,obj2[i].height) then
        return true
      else
        return false
      end
    else
      return false
  end
end

return level