return function(x_pos,y_pos)
  local chapterPanel = {
    x = x_pos,
    y = y_pos,
    Sprite = love.graphics.newImage("Sprites/chapterPanel.png")
  }
  return chapterPanel
end
