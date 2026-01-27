return function(x_pos,y_pos)
  local entity = {
    x = x_pos,
    y = y_pos,
    Sprite = love.graphics.newImage("Sprites/Player.png")
  }
  return entity
end
