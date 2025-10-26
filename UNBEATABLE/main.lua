Mx = 800;Mx2 = 1000
Nx = 1200;Nx2 = 1400
Ox = 1600;Ox2 = 1800
Px = 2000;Px2 = 2200
local Player = require("player")
local Bullet = require("bullet")
function love.load()
  player = Player.new(0,10)
  bullet = Bullet.new(100,100)
  C = {}
  C.sprite = love.graphics.newImage('Sprites/enemyWhite.png')
  C.x = 750
  C.y = 0
  box = {}
  box.speed = 3.5
end
function distanceTo(P1X,P1Y,P2X,P2Y)
   local Xdiff = P2X - P1X;local Ydiff = P2Y - P1Y;DistApart = Xdiff + Ydiff
   return DistApart
end
function love.update(dt)
  player:update(dt)
  bullet:update(dt)
  
  
  C.y = player.y
  Mx = Mx - box.speed;Mx2 = Mx2 - box.speed
  Nx = Nx - box.speed;Nx2 = Nx2 - box.speed
  Ox = Ox - box.speed;Ox2 = Ox2 - box.speed
  Px = Px - box.speed;Px2 = Px2 - box.speed
  if Mx <= -320 then Mx = 800 elseif Mx2 <= -120 then Mx2 = 1000 end
  if Nx <= -320 then Nx = 800 elseif Nx2 <= -120 then Nx2 = 1000 end
  if Ox <= -320 then Ox = 800 elseif Ox2 <= -120 then Ox2 = 1000 end
  if Px <= -320 then Px = 800 elseif Px2 <= -120 then Px2 = 1000 end

  --if player.y < 0 or player.x < 0 then repostion(player) 
  --elseif player.y > 600 or player.x > 800 then repostion(player) 
  --end
  --moveMent()
end
function love.draw()
  player:draw()
  bullet:draw()

  love.graphics.rectangle("fill",Mx,80,120,80);love.graphics.rectangle("fill",Mx2,80,120,80)
  love.graphics.rectangle("fill",Nx,200,120,80);love.graphics.rectangle("fill",Nx2,200,120,80)
  love.graphics.rectangle("fill",Ox,300,120,80);love.graphics.rectangle("fill",Ox2,300,120,80)
  love.graphics.rectangle("fill",Px,415,120,80);love.graphics.rectangle("fill",Px2,415,120,80)

  love.graphics.rectangle("fill",699,499,100,100);love.graphics.draw(C.sprite,C.x,C.y)
  --if distanceTo(player.x,player.y,699,550) <= 600 then
  --   bullet.sprite = love.graphics.newImage('Sprites/RedBullet.png')
   --  C.sprite = love.graphics.newImage('Sprites/enemyRed.png')
  --else if distanceTo(player.x,player.y,699,499) > 600 then 
  --   C.sprite = love.graphics.newImage('Sprites/enemyWhite.png') end
  --end
end
--A project by Louis Andrew (GODTIER)