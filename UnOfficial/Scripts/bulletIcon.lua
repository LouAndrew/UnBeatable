
return function(x_pos,ypos)
  local bullIcon = {
      x = x_pos,
      y = y_pos,
      Sprite = love.graphics.newImage("Sprites/bullet.png")
    }
    return bullIcon
end
