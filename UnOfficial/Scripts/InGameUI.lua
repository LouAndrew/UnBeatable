local IngameUI = {
  hearts = {},
  bullIcns1 = {},
  bullIcns2 = {},
  shootp1 = true,
  shootp2 = false
}
IngameUI.__index = IngameUI

local Player = require("Scripts/player")
local Circle = require("Scripts/Circle")
local heart = require("Scripts/heart")
local bullIcon = require("Scripts/bulletIcon")

local bullIcnDetails1 = {
  bullIcnNum = 1,
  bullIconXpos = 780,
  bullIconYpos = 10
}
local bullIcnDetails2 = {
  bullIcnNum = 1,
  bullIconXpos = 650,
  bullIconYpos = 10
}

local bullNum1 = 0
local bullNum2 = 0
local shoot = true

local hx = 10
local h = 1
local hy = 10

function IngameUI:new()
   local instance = setmetatable({},IngameUI)
   Player = Player.new()
   Circle = Circle.new()
   return instance
end

function IngameUI:update()
  if love.keyboard.isDown("0") then
    IngameUI.shootp2 = true
    IngameUI.shootp1 = false
  end
  if love.keyboard.isDown("9") then
    IngameUI.shootp1 = true
    IngameUI.shootp2 = false
  end
  Player.bullNUm = bullNum1
  Circle.bullNUm = bullNum2
  if love.keyboard.isDown("o") then
    if shoot then
      if (IngameUI.shootp1) then
        bullNum1 = bullNum1 + 1
        table.remove(IngameUI.bullIcns1,1)
        shoot = false
      elseif (IngameUI.shootp2) then
        bullNum2 = bullNum2 + 1
        table.remove(IngameUI.bullIcns2,1)
        shoot = false
      end
    end
  else
    shoot = true
  end
  while (h <= 5) do
    table.insert(IngameUI.hearts,heart(hx,hy))
    h = h + 1
    hx = hx + 35
  end
  
  bullIcnDetails2.bullIcnNum = icnDrawer(IngameUI.bullIcns2,bullIcon,bullIcnDetails2.bullIcnNum,bullIcnDetails2.bullIconXpos,bullIcnDetails2.bullIconYpos)
  
  bullIcnDetails1.bullIcnNum = icnDrawer(IngameUI.bullIcns1,bullIcon,bullIcnDetails1.bullIcnNum,bullIcnDetails1.bullIconXpos,bullIcnDetails1.bullIconYpos)
  
  if (bullNum1 > 4) then
    bullIcnDetails1.bullIcnNum = 1
    bullIcnDetails1.bullIconXpos = 780
    bullNum1 = 0
  end
  
  if (bullNum2 > 4) then
    bullIcnDetails2.bullIcnNum = 1
    bullNum2 = 0
    bullIcnDetails2.bullIconXpos = 650
  end
  --resetBullCount(bullNum2,bullIcnDetails2.bullIcnNum,bullIcnDetails2.bullIconXpos)
end


function IngameUI:draw()
  for _,hrtI in ipairs(IngameUI.hearts) do
    love.graphics.draw(hrtI.Sprite,hrtI.x,hrtI.y)
  end
  for _,bulli in ipairs(IngameUI.bullIcns1) do
    love.graphics.draw(bulli.Sprite,bulli.x,bulli.y)
  end
  for _,bulli in ipairs(IngameUI.bullIcns2) do
    love.graphics.draw(bulli.Sprite,bulli.x,bulli.y)
  end
end

function icnDrawer(icnTable,icnInit,icnNum,icnXpos,icnYpos)
  while (icnNum <= 3) do
    table.insert(icnTable,icnInit(icnXpos,icnYpos))
    icnNum = icnNum + 1
    icnXpos = icnXpos - 35
  end
  return icnNum
end

function resetBullCount(bullNum,iconNum,iconXpos)
  if (bullNum > 4) then
    bullNum = 0
    iconNum = 1
    iconXpos = 650
    print(iconNum)
  end
  return bullNum,iconNum,iconXpos
end


return IngameUI