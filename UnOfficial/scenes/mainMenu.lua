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
local texts = {"PLAY","CHAPTERS","CREDITS","EXIT","SETTINGS"}
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
  
  icnDrawer(buttons,buttonImg,btnNum,740,60,0,1)
  icnDrawer(buttons,buttonImg,btnNum,btnXpos,btnYpos,-205,4)
end

function mainMenu:draw()
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

local num = 1
function drawElements(element)
  for i,elem in ipairs(element) do
    --elem.text = texts[i]
    love.graphics.print(elem.text,elem.x,elem.y)
    num = num + 1
  end
end
return mainMenu