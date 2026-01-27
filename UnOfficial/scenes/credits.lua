local credits = {}
credits.__index = credits

function credits:new()
  local instance = setmetatable({},credits)
  return instance
end

function credits:update()
end

function credits:draw()
end

return credits