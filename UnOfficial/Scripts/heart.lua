
return function(x_pos,y_pos)
    local heart = {
      x = x_pos,
      y = y_pos,
      Sprite = love.graphics.newImage("Sprites/heartIcon.png")
      }
    return heart
  end
  