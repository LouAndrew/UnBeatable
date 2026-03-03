local settings = {}
settings.__index = settings

local background = require("Scripts/UIElements/background")

function settings:new()
  local instance = setmetatable({},settings)
  local background = background.new()
  return instance
end

function settings:update()
end

function settings:draw()
  background.draw()
end

return settings