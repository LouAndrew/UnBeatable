fR = false;fL = false;fU = false;fD = false;Pull = true
Mx = 800;Mx2 = 1000
Nx = 1200;Nx2 = 1400
Ox = 1600;Ox2 = 1800
Px = 2000;Px2 = 2200
function love.load()
  bullet = {}
  bullet.x = 100
  bullet.y = 100
  bullet.speed = 40
  bullet.sprite = love.graphics.newImage('Sprites/RedBullet.png')
  C = {}
  C.sprite = love.graphics.newImage('Sprites/enemyWhite.png')
  C.x = 750
  C.y = 0
  player = {}
  player.x = 20
  player.y = 20
  player.speed = 3.5
  player.sprite = love.graphics.newImage('Sprites/Player.png')
end
function pullEffect(object)
   if Pull == true then
   local gravity = 0.5
   if fR == true then object.x = object.x + gravity end
   if fL == true then object.x = object.x - gravity end
   if fU == true then object.y = object.y - gravity end
   if fD == true then object.y = object.y + gravity end
   end
end
function stopPlayer()
   Pull = false;player.x = C.x;player.y = C.y end 
function repostion(Item)
   Item.x = 0;Item.y = 0 end
function distanceTo(P1X,P1Y,P2X,P2Y)
   local Xdiff = P2X - P1X;local Ydiff = P2Y - P1Y;DistApart = Xdiff + Ydiff
   return DistApart
end
function moveMent()
   if love.keyboard.isDown("e") then
      fR = true; fL = false; fU = false
      fD = false; player.x = player.x + player.speed
   elseif love.keyboard.isDown("q") then
      fL = true; fR = false; fU = false;
      fD = false; player.x = player.x - player.speed
   end
   if love.keyboard.isDown("w") then
      fU = true; fR = false; fL = false
      fD = false; player.y = player.y - player.speed
   elseif love.keyboard.isDown("s") then
      fD = true; fR = false; fL = false
      fU = false; player.y = player.y + player.speed
   end 
 end

function love.update(dt)
  bullet.y = C.y
  bullet.x = bullet.x - bullet.speed
  
  pullEffect(player)
  C.y = player.y
  Mx = Mx - player.speed;Mx2 = Mx2 - player.speed
  Nx = Nx - player.speed;Nx2 = Nx2 - player.speed
  Ox = Ox - player.speed;Ox2 = Ox2 - player.speed
  Px = Px - player.speed;Px2 = Px2 - player.speed
  if Mx <= -320 then Mx = 800 elseif Mx2 <= -120 then Mx2 = 1000 end
  if Nx <= -320 then Nx = 800 elseif Nx2 <= -120 then Nx2 = 1000 end
  if Ox <= -320 then Ox = 800 elseif Ox2 <= -120 then Ox2 = 1000 end
  if Px <= -320 then Px = 800 elseif Px2 <= -120 then Px2 = 1000 end
  if player.x == C.x and player.y == C.y then
     print("got me")
  end 
  if player.y < 0 or player.x < 0 then repostion(player) 
  elseif player.y > 600 or player.x > 800 then repostion(player) 
  end
  moveMent()
end
function love.draw()
  love.graphics.draw(player.sprite,player.x,player.y)
  
  love.graphics.rectangle("fill",Mx,80,120,80);love.graphics.rectangle("fill",Mx2,80,120,80)
  love.graphics.rectangle("fill",Nx,200,120,80);love.graphics.rectangle("fill",Nx2,200,120,80)
  love.graphics.rectangle("fill",Ox,300,120,80);love.graphics.rectangle("fill",Ox2,300,120,80)
  love.graphics.rectangle("fill",Px,415,120,80);love.graphics.rectangle("fill",Px2,415,120,80)

  love.graphics.rectangle("fill",699,499,100,100);love.graphics.draw(C.sprite,C.x,C.y)
  if distanceTo(player.x,player.y,699,550) <= 600 then
     love.graphics.draw(bullet.sprite,bullet.x,bullet.y)
     C.sprite = love.graphics.newImage('Sprites/enemyRed.png')
  else if distanceTo(player.x,player.y,699,499) > 600 then 
     C.sprite = love.graphics.newImage('Sprites/enemyWhite.png') end
  end
end
--A project by Louis Andrew (GODTIER)