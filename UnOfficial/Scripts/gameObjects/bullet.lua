local _ = require("Scripts/Physics")
local Images = {
  love.graphics.newImage('Sprites/bullet.png')
}
--return function(x_pos,y_pos)
--  local bullet = {
--  Sprite = Images[1],
--  x = x_pos,
--  y = y_pos,
--  width = Images[1]:getWidth(),
--  height = Images[1]:getHeight()
--  }
--  return bullet
--end

return function(x_pos, y_pos, target_x, target_y, speed)
  local dx = target_x - x_pos
  local dy = target_y - y_pos
  local length = math.sqrt(dx * dx + dy * dy)
  
  local dir_x, dir_y
  if length > 0 then
    dir_x = dx / length
    dir_y = dy / length
  else
    dir_x = 0
    dir_y = 0
  end
  
  local bullet = {
    Sprite = Images[1],
    x = x_pos,
    y = y_pos,
    width = Images[1]:getWidth(),
    height = Images[1]:getHeight(),
    dir_x = dir_x,
    dir_y = dir_y,
    speed = speed or 300,
    
    update = function(self, dt)
      self.x = self.x + self.dir_x * self.speed * dt
      self.y = self.y + self.dir_y * self.speed * dt
    end,
    
    draw = function(self)
      love.graphics.drawCenter(self.Sprite, self.x, self.y)
    end
  }
  return bullet
  end