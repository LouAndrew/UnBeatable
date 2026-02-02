return function(x_pos,y_pos)
  local buttonImg = {
    x = x_pos,
    y = y_pos,
    isHovered = false,
    Sprite = love.graphics.newImage("Sprites/button.png")
  }
  return buttonImg
 end
