return function(x_pos,y_pos)
  local homeIcn = {
    x = x_pos,
    y = y_pos,
    Sprite = love.graphics.newImage("Sprites/homeIcon.png")
  }
  return homeIcn
end
