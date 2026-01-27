local settings = {}
settings.__index = settings

function settings:new()
  local instance = setmetatable({},settings)
  return instance
end

function settings:update()
end

function settings:draw()
end

return settings