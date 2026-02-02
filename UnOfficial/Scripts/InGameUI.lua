local Player = require("Scripts/gameObjects/player")
local Circle = require("Scripts/gameObjects/Circle")
local heart = require("Scripts/UIElements/heart")
local bullIcon = require("Scripts/UIElements/bulletIcon")
local entityIcon = require("Scripts/UIElements/entityIcon")


local IngameUI = {
  hearts = {},
  bullIcns1 = {}, bullIcns2 = {},
  shootp1 = true, shootp2 = false,
  entityIcns = {}, score = 0
}
IngameUI.__index = IngameUI

local entityIcnDetails = {
  entityIcnNum = 1,
  entityIcnXpos = 760,entityIcnYpos = 10
}

local bullIcnDetails1 = {
  bullIcnNum = 1,
  bullIconXpos = 730, bullIconYpos = 20
}
local bullIcnDetails2 = {
  bullIcnNum = 1,
  bullIconXpos = 590, bullIconYpos = 20
}
local heartDetails = {
  heartNum = 1,
  heartXpos = 10, heartYpos = 10
}

local bullNum1 = 0
local bullNum2 = 0
local shoot = true

local scoreInCremVal = 10
local updateScore = true

function IngameUI:new()
   local instance = setmetatable({},IngameUI)
   local font = love.graphics.newFont("fonts/Tsuchigumo.ttf",60)
   return instance
end

function IngameUI:update()
  Player.bullNUm = bullNum1
  Circle.bullNUm = bullNum2
  
  if love.keyboard.isDown("0") then
    IngameUI.shootp2 = true
    IngameUI.shootp1 = false
  end
  if love.keyboard.isDown("9") then
    IngameUI.shootp1 = true
    IngameUI.shootp2 = false
  end
  
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
  
  entityIcnDetails.entityIcnNum = icnDrawer(IngameUI.entityIcns,entityIcon,entityIcnDetails.entityIcnNum,entityIcnDetails.entityIcnXpos,entityIcnDetails.entityIcnYpos,145,2)
  
  heartDetails.heartNum = icnDrawer(IngameUI.hearts,heart,heartDetails.heartNum,heartDetails.heartXpos,heartDetails.heartYpos,-35,5)
  
  bullIcnDetails2.bullIcnNum = icnDrawer(IngameUI.bullIcns2,bullIcon,bullIcnDetails2.bullIcnNum,bullIcnDetails2.bullIconXpos,bullIcnDetails2.bullIconYpos,35,3)
  
  bullIcnDetails1.bullIcnNum = icnDrawer(IngameUI.bullIcns1,bullIcon,bullIcnDetails1.bullIcnNum,bullIcnDetails1.bullIconXpos,bullIcnDetails1.bullIconYpos,35,3)
  
  if (bullNum1 > 4) then
    bullIcnDetails1.bullIcnNum = 1
    bullIcnDetails1.bullIconXpos = 730
    bullNum1 = 0
  end
  
  if (bullNum2 > 4) then
    bullIcnDetails2.bullIcnNum = 1
    bullNum2 = 0
    bullIcnDetails2.bullIconXpos = 590
  end
  --resetBullCount(bullNum2,bullIcnDetails2.bullIcnNum,bullIcnDetails2.bullIconXpos)
end


function IngameUI:draw()
  drawElements(IngameUI.entityIcns)
  drawElements(IngameUI.hearts)
  drawElements(IngameUI.bullIcns1)
  drawElements(IngameUI.bullIcns2)
  love.graphics.setFont(font)
  love.graphics.print(tostring(IngameUI.score), 350, 20)
end

function drawElements(element)
  for _,elem in ipairs(element) do
    love.graphics.draw(elem.Sprite,elem.x,elem.y)
  end
end

function icnDrawer(icnTable,icnInit,icnNum,icnXpos,icnYpos,incremVal,icnLength)
  while (icnNum <= icnLength) do
    table.insert(icnTable,icnInit(icnXpos,icnYpos))
    icnNum = icnNum + 1
    icnXpos = icnXpos - incremVal
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

function IngameUI:increaseScore()
  IngameUI.score = IngameUI.score + 10
end

return IngameUI