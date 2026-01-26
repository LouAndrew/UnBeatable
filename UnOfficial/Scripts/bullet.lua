local Images = {
  love.graphics.newImage('Sprites/bullet.png')
}
return function(x_pos,y_pos)
  local bullet = {
  Sprite = Images[1],
  x = x_pos,
  y = y_pos,
  width = Images[1]:getWidth(),
  height = Images[1]:getHeight()
  }
  return bullet
end