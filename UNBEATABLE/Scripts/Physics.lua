function Colliding(obj1,obj2)
  if (obj1.x + obj1.width) >= obj2.x and 
     obj1.x <= (obj2.x + obj2.width) and
     (obj1.y + obj1.height) >= obj2.y and 
     obj1.y <= (obj2.y + obj2.height) then
   obj1.x = obj1.x;obj1.y = obj1.y 
   isColliding(obj1,false,true)
   return true
  else
    isColliding(obj1,true,false)
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

function distanceTo(P1X,P1Y,P2X,P2Y)
   local Xdiff = P2X - P1X;
   local Ydiff = P2Y - P1Y;
   DistApart = Xdiff + Ydiff
   return DistApart
end