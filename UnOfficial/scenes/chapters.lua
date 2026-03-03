local chapters = {}
chapters.__index = chapters

local background = require("Scripts/UIElements/background")
local chapterUI = require("Scripts/UIElements/chapterUI")
local chapterUI2 = require("Scripts/UIElements/chapterUI2")
local homeIcn = require("Scripts/UIElements/homeIcon")
local _ = require("Scripts/Physics")

local chapterPanels = {}
local chapterPanels2 = {}
local homeIcons = {}

local chapterPanelDetails = {
  panelNum = 1,
  panelXpos = 130,
  panelYpos = 230 
}

local chapterPanelDetails2 = {
  panelNum = 1,
  panelXpos = 170,
  panelYpos = 500
}

local homeIcnDetails = {
  icnNum = 1,
  icnXpos = 400,
  icnYpos = 40
}

function chapters:new()
  local instance = setmetatable({},chapters)
  return instance
end

function chapters:update()
  icnDrawer(chapterPanels,chapterUI,chapterPanelDetails.panelNum,chapterPanelDetails.panelXpos,chapterPanelDetails.panelYpos,-270,3)
  icnDrawer(chapterPanels2,chapterUI2,chapterPanelDetails2.panelNum,chapterPanelDetails2.panelXpos,chapterPanelDetails2.panelYpos,-460,2)
  icnDrawer(homeIcons,homeIcn,homeIcnDetails.icnNum,homeIcnDetails.icnXpos,homeIcnDetails.icnYpos,-10,2)
end

function chapters:draw()
  background:draw()
  drawElements(chapterPanels)
  drawElements(chapterPanels2)
  drawElements(homeIcons)
end

function icnDrawer(icnTable,icnInit,icnNum,icnXpos,icnYpos,incremVal,icnLength)
  while (icnNum <= icnLength) do
    table.insert(icnTable,icnInit(icnXpos,icnYpos))
    icnNum = icnNum + 1
    icnXpos = icnXpos - incremVal
  end
  return icnNum
end

function drawElements(element)
  for i,elem in ipairs(element) do
   love.graphics.drawCenter(elem.Sprite,elem.x,elem.y)
  end
end
return chapters
