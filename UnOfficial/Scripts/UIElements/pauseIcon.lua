return function(x_pos,y_pos)
  local pauseIcn = {
    x = x_pos,
    y = y_pos,
    Sprite = love.graphics.newImage("Sprites/pauseIcon.png")
  }
  return pauseIcn
end
