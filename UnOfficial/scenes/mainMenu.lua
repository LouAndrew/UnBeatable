local mainMenu = {}
mainMenu.__index = mainMenu

local buttonImg = require("Scripts/UIElements/button")
local _ = require("Scripts/Physics")
local targetScale = 5
local scaleSpeed = 2
local mouse = {
  x = 0,
  y = 0
}
local images = {
  love.graphics.newImage("Sprites/playUI.png"),
  love.graphics.newImage("Sprites/chapterUI.png"),
  love.graphics.newImage("Sprites/roomUI.png"),
  love.graphics.newImage("Sprites/exitUI.png"),
  love.graphics.newImage("Sprites/settingsUI.png")
}
local  background = {
  x = 400,
  y = 300,
  Sprite = love.graphics.newImage("Sprites/BackGround1.png")
}

local buttons = {}
local btnNum = 1
local btnXpos = 100
local btnYpos = 525

function mainMenu:new()
  local instance = setmetatable({},mainMenu)
  return instance
end

function mainMenu:update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()
  
  for _,btn in ipairs(buttons) do
    btn.isHovered = false
    if (btn.isHovered) then
      
    end
  end
  
  icnDrawer(buttons,buttonImg,btnNum,btnXpos,btnYpos,-205,4)
  icnDrawer(buttons,buttonImg,btnNum,740,60,0,1)
  
end

function mainMenu:draw()
  love.graphics.drawCenter(background.Sprite,background.x,background.y)
  drawElements(buttons)
  
end

function icnDrawer(icnTable,icnInit,icnNum,icnXpos,icnYpos,incremVal,icnLength)
  while (icnNum <= icnLength) do
    table.insert(icnTable,icnInit(icnXpos,icnYpos))
    icnNum = icnNum + 1
    icnXpos = icnXpos - incremVal
  end
  return icnNum
end

num = 1
function drawElements(element)
  for i,elem in ipairs(element) do
    if(num <= 5) then
      elem.Sprite = images[num]
      num = num + 1
    end
    love.graphics.drawCenter(elem.Sprite,elem.x,elem.y)
  end
end

return mainMenu