local chapters = {}
chapters.__index = chapters

function chapters:new()
  local instance = setmetatable({},chapters)
  return instance
end

function chapters:update()
end

function chapters:draw()
end

return chapters
