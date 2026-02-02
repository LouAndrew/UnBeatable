return function(x_pos,y_pos)
  local entity = {
    x = x_pos,
    y = y_pos,
    Sprite = love.graphics.newImage("Sprites/entity1.png")
  }
  return entity
end
