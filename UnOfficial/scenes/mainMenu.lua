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
local scenes = {"levels/level1"}

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
local newScene = nil
local buttons = {}
local btnNum = 1
local btnXpos = 100
local btnYpos = 525
local scn = 1
function mainMenu:new()
  local instance = setmetatable({},mainMenu)
  return instance
end
function mainMenu:update(dt)
  if (scn == 1) then
    mouse.x, mouse.y = love.mouse.getPosition()
  
    for _,btn in ipairs(buttons) do
      btn.isHovered = false
      icnSelector()
      if (btn.isHovered) then
      
      end
    end
    icnDrawer(buttons,buttonImg,btnNum,btnXpos,btnYpos,-205,4)
    icnDrawer(buttons,buttonImg,btnNum,740,60,0,1)
  elseif (scn == 2) then 
    newScene:update(dt)
  end
end

function mainMenu:draw()
  if (scn == 1) then
    love.graphics.drawCenter(background.Sprite,background.x,background.y)
    drawElements(buttons)
  elseif (scn == 2) then
    newScene:draw()
  elseif (scn == 6) then
    newScene:draw()
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

function icnSelector()
  if ( ((distanceTo(buttons[1],mouse)) <= 30 and (distanceTo(buttons[1],mouse)) >= -30) and (love.keyboard.isDown("space")) ) then
    scn = 2
    newScene = require("scenes/chapters")
    newScene.new()
    
  elseif ( ((distanceTo(buttons[2],mouse)) <= 30 and (distanceTo(buttons[2],mouse)) >= -30) and (love.keyboard.isDown("space")) ) then
    print("detected 2")
  elseif ( ((distanceTo(buttons[3],mouse)) <= 30 and (distanceTo(buttons[3],mouse)) >= -30) and (love.keyboard.isDown("space")) ) then
    print("detected 3")
  elseif ( ((distanceTo(buttons[4],mouse)) <= 30 and (distanceTo(buttons[4],mouse)) >= -30) and (love.keyboard.isDown("space")) ) then
    print("detected 4")
  elseif ( ((distanceTo(buttons[5],mouse)) <= 30 and (distanceTo(buttons[5],mouse)) >= -30) and (love.keyboard.isDown("space")) ) then
    scn = 6
    newScene = require("scenes/settings")
    newScene.new()
  end
  
end

return mainMenu