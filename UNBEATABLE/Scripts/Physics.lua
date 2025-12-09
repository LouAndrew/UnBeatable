function Colliding(obj1,obj2)
  if (obj1.x + obj1.width) >= obj2.x and 
     obj1.x <= (obj2.x + obj2.width) and
     (obj1.y + obj1.height) >= obj2.y and 
     obj1.y <= (obj2.y + obj2.height) then
   --obj1.x = obj1.x;obj1.y = obj1.y 
   --isColliding(obj1,false,true)
   return true
  else
    --isColliding(obj1,true,false)
    return false
	end
end

function centerCollision(obj)
  local left = obj.x - obj.width/2
  local right = obj.x + obj.width/2
  local top = obj.y - obj.height/2
  local bottom = obj.y + obj.height/2
  
  return{
    x = left,
    y = top,
    left = left,
    right = right,
    top = top,
    bottom = bottom,
    width = obj.width,
    height = obj.heiht,
    centerX = obj.x,
    centerY = obj.y
    }
end

function BoxPlayerColliding(obj1,obj2)
  if (obj1.x + obj1.width) >= obj2.Blevel1.B1.x and obj1.x <= (obj2.Blevel1.B1.x + obj2.Blevel1.B1.width) and (obj1.y + obj1.height) >= obj2.Blevel1.B1.y and  obj1.y <= (obj2.Blevel1.B1.y + obj2.Blevel1.B1.height) or
  (obj1.x + obj1.width) >= obj2.Blevel1.B2.x and obj1.x <= (obj2.Blevel1.B2.x + obj2.Blevel1.B2.width) and (obj1.y + obj1.height) >= obj2.Blevel1.B2.y and  obj1.y <= (obj2.Blevel1.B2.y + obj2.Blevel1.B2.height) or
  (obj1.x + obj1.width) >= obj2.Blevel2.B1.x and obj1.x <= (obj2.Blevel2.B1.x + obj2.Blevel2.B1.width) and (obj1.y + obj1.height) >= obj2.Blevel2.B1.y and  obj1.y <= (obj2.Blevel2.B1.y + obj2.Blevel2.B1.height) or 
  (obj1.x + obj1.width) >= obj2.Blevel2.B2.x and obj1.x <= (obj2.Blevel2.B2.x + obj2.Blevel2.B2.width) and (obj1.y + obj1.height) >= obj2.Blevel2.B2.y and  obj1.y <= (obj2.Blevel2.B2.y + obj2.Blevel2.B2.height) or
  (obj1.x + obj1.width) >= obj2.Blevel3.B1.x and obj1.x <= (obj2.Blevel3.B1.x + obj2.Blevel3.B1.width) and (obj1.y + obj1.height) >= obj2.Blevel3.B1.y and  obj1.y <= (obj2.Blevel3.B1.y + obj2.Blevel3.B1.height) or
  (obj1.x + obj1.width) >= obj2.Blevel3.B2.x and obj1.x <= (obj2.Blevel3.B2.x + obj2.Blevel3.B2.width) and (obj1.y + obj1.height) >= obj2.Blevel3.B2.y and  obj1.y <= (obj2.Blevel3.B2.y + obj2.Blevel3.B2.height) or
  (obj1.x + obj1.width) >= obj2.Blevel4.B1.x and obj1.x <= (obj2.Blevel4.B1.x + obj2.Blevel4.B1.width) and (obj1.y + obj1.height) >= obj2.Blevel4.B1.y and  obj1.y <= (obj2.Blevel4.B1.y + obj2.Blevel4.B1.height) or
  (obj1.x + obj1.width) >= obj2.Blevel4.B2.x and obj1.x <= (obj2.Blevel4.B2.x + obj2.Blevel4.B2.width) and (obj1.y + obj1.height) >= obj2.Blevel4.B2.y and  obj1.y <= (obj2.Blevel4.B2.y + obj2.Blevel4.B2.height) or
  (obj1.x + obj1.width) >= obj2.Blevel4.B3.x and obj1.x <= (obj2.Blevel4.B3.x + obj2.Blevel4.B3.width) and (obj1.y + obj1.height) >= obj2.Blevel4.B3.y and  obj1.y <= (obj2.Blevel4.B3.y + obj2.Blevel4.B3.height)
  then
    return true
  else
    return false
  end
end

function isColliding(obj1,MOVE,NOTMOVE)
  if NOTMOVE ~= MOVE then
    obj1.moveRight = MOVE 
  elseif NOTMOVE ~= MOVE then
    obj1.moveLeft = MOVE
  end 
  
  if NOTMOVE ~= MOVE then
    obj1.moveUp =  MOVE
  elseif NOTMOVE ~= MOVE then
    obj1.moveDown = MOVE
  end
end

function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end
function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end

function distanceTo(obj1,obj2)
  local P1X = obj1.x
  local P1Y = obj1.y
  local P2X = obj2.x
  local P2Y = obj2.y
  local Xdiff = P2X - P1X;
  local Ydiff = P2Y - P1Y;
  DistApart = Xdiff + Ydiff
  return DistApart
end

function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end