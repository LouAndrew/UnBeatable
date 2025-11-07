local MainMenu = {}
MainMenu.__index = MainMenu
function newButton(text, fn)
  return {text = text;fn = fn}
end
local Buttons = {}

function MainMenu:new()
  local instance = setmetatable({},MainMenu)
  
  return instance
end

function MainMenu:load()
  table.insert(Buttons,newButton("Start",fun))
  table.insert(Buttons,newButton("Load",fn))
  table.insert(Buttons,newButton("End",fn))
  table.insert(Buttons,newButton("Exit",love.event.quit(0)))
end

function MainMenu:draw()
  local ww = love.graphics.getWidth()
  local wh = love.graphics.getHeight()
  local buttonWidth = ww * (1/3)
  local buttonHeight = wh * (1/7)
  for i, button in ipairs(Buttons) do
    print("bgufid")
    love.graphics.rectangle("fill",(ww*0.5)-buttonWidth*0.5,(wh*0.5)-buttonHeight*0.5,buttonWidth,buttonHeight)
  end
end
return MainMenu