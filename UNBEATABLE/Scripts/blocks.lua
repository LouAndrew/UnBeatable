local blocks = {}
blocks.__index = blocks
blocks.speed = 100
blocks.altx = -200
local wave = 1
local wv = 0
local showSquare = true

local _ = require("Scripts/Physics")
local player = require("Scripts/player")
local circle = require("Scripts/Circle")

local B1 = 1
local B2 = 1
local B3 = 1
local B4 = 1

local square = {
  Sprite = love.graphics.newImage('Sprites/Square.png'),
  x = 400,
  y = 300,
  width = 0,
  height = 0
}

local Images = {
  love.graphics.newImage('Sprites/Tile1.png'),
  love.graphics.newImage('Sprites/Tile2.png'),
  love.graphics.newImage('Sprites/Tile3.png')
}

local BlockLevels = {
      Blevel1 = {
         B1 = {
              Sprite = Images[1],
              x = 55,
              y = -90,
              width = Images[1]:getWidth(),
              height = Images[1]:getHeight()
         },    
         B2= {
             Sprite = Images[1],
             x = 746,
             y = -90,
             width = Images[1]:getWidth(),
             height = Images[1]:getHeight()
        } 
      },
      Blevel2 = { 
         B1 = {
             Sprite = Images[B2],
             x = 160,
             y = -90,
             width = Images[B2]:getWidth(),
             height = Images[B2]:getHeight()
         },    
         B2= {
             Sprite = Images[B2],
             x = 641,
             y = -90,
             width = Images[B2]:getWidth(),
             height = Images[B2]:getHeight()
        } 
      },
      Blevel3 = { 
         B1 = {
              Sprite = Images[B3],
              x = 200,
              y = -90,
              width = Images[B3]:getWidth(),
              height = Images[B3]:getHeight()
         },    
         B2= {
             Sprite = Images[B3],
             x = 601,
             y = -90,
             width = Images[B3]:getWidth(),
             height = Images[B3]:getHeight()
         } 
      },
      Blevel4 = { 
         B1 = {
              Sprite = Images[B4],
              x = 55,
              y = -90,
              width = Images[B4]:getWidth(),
              height = Images[B4]:getHeight()
         },    
        B2 = {
             Sprite = Images[B4],
             x = 746,
             y = -90,
             width = Images[B4]:getWidth(),
             height = Images[B4]:getHeight()
         },    
        B3= {
            Sprite = Images[1],
            x = 400,
            y = -90,
            width = Images[1]:getWidth(),
            height = Images[1]:getHeight()
         } 
      }
    }
function arrangeBlocks()
  local positions = { 
    {{55,-120,260,-120},{-90,120,-90,190}},{{746,-120,540,-120},{-90,320,-90,380}},
    {{160,-120,100,-120},{-90,160,-90,60}},{{641,-120,700,-120},{-90,410,-90,540}},
    {{200,-120,290,-120},{-90,120,-90,120}},{{601,-120,510,-120},{-90,400,-90,480}},
    {{55,-120,55,-120},{-90,170,-90,250}},{{746,-120,746,-120},{-90,350,-90,420}},{{400,-120,400,-120},{-90,400,-90,400}}
  }
  local i = 1
  local coordinates = 1
  if wv ~= wave and wave < 5 then
    wv = wv + 1
    BlockLevels.Blevel1.B1.x = positions[1][coordinates][wv]; BlockLevels.Blevel1.B1.y = positions[1][coordinates+i][wv]
    BlockLevels.Blevel1.B2.x = positions[2][coordinates][wv]; BlockLevels.Blevel1.B2.y = positions[2][coordinates+i][wv]

    BlockLevels.Blevel2.B1.x = positions[3][coordinates][wv]; BlockLevels.Blevel2.B1.y = positions[3][coordinates+i][wv]
    BlockLevels.Blevel2.B2.x = positions[4][coordinates][wv]; BlockLevels.Blevel2.B2.y = positions[4][coordinates+i][wv]

    BlockLevels.Blevel3.B1.x = positions[5][coordinates][wv]; BlockLevels.Blevel3.B1.y = positions[5][coordinates+i][wv]
    BlockLevels.Blevel3.B2.x = positions[6][coordinates][wv]; BlockLevels.Blevel3.B2.y = positions[6][coordinates+i][wv]

    BlockLevels.Blevel4.B1.x = positions[7][coordinates][wv]; BlockLevels.Blevel4.B1.y = positions[7][coordinates+i][wv]
    BlockLevels.Blevel4.B2.x = positions[8][coordinates][wv]; BlockLevels.Blevel4.B2.y = positions[8][coordinates+i][wv]
    
    if (wv%2) == 0 then
      B3 = 3
      BlockLevels.Blevel3.B1.Sprite = Images[B3]
      BlockLevels.Blevel3.B2.Sprite = Images[B3]
      if wv == 4 then
        B1 = 3
        B2 = 1
        BlockLevels.Blevel1.B1.Sprite = Images[B1]
        BlockLevels.Blevel1.B2.Sprite = Images[B1]
        BlockLevels.Blevel2.B1.Sprite = Images[B2]
        BlockLevels.Blevel2.B2.Sprite = Images[B2]
      end
    end
    if (wv%2) ~= 0 then
      B3 = 2
      BlockLevels.Blevel3.B1.Sprite = Images[B3]
      BlockLevels.Blevel3.B2.Sprite = Images[B3]
      if wv == 3 then
        B2 = 2
        B4 = 3
        BlockLevels.Blevel2.B1.Sprite = Images[B2]
        BlockLevels.Blevel2.B2.Sprite = Images[B2]
        BlockLevels.Blevel4.B1.Sprite = Images[B4]
        BlockLevels.Blevel4.B2.Sprite = Images[B4]
      end
    end
  end
end

function blocks:new()
   local instance = setmetatable({},blocks)
   return instance
end

function createPulseEffect(initialScale,targetScale,speed)
  local currentScale = initialScale
  local pulseDirection = 1
  
  return function(dt)
    currentScale = currentScale + (speed * dt * pulseDirection)
    if pulseDirection == 1 and currentScale >= targetScale then
      currentScale = targetScale
      pulseDirection = -1
    elseif pulseDirection == -1 and currentScale <= initialScale then
      currentScale = initialScale
      pulseDirection = 1
    end
    return currentScale
  end
end

local pulse = createPulseEffect(1.0,1.1,0.2)

function blocks:update(dt)
--  local i = 1
--  repeat
--    centerCollision(BlockLevels.Blevel1.B1)
--  until i == 1
  boxPlayerPos(player,BlockLevels.Blevel1.B1,wave)
  local currentScale = pulse(dt)
  detectCollision()
  arrangeBlocks()
  waves(dt)
end

function detectCollision()
  if (BlockLevels.Blevel1.B1.y or BlockLevels.Blevel1.B1.x) >= -70 then
    if BoxPlayerColliding(player,BlockLevels) or BoxPlayerColliding(circle,BlockLevels) then
      blocks.speed = -200
    end
  else
    blocks.speed = 100
  end
end

function alignToCenter(obj)
  obj.width = obj.x - obj.width/2
  obj.height = obj.y - obj.height/2
  print(obj.width)
  --print(obj.height)
  --print(obj.height*obj.width)
end

function waves(dt)
  if (wave%2) ~= 0 then
    BlockLevels.Blevel1.B1.y = BlockLevels.Blevel1.B1.y + blocks.speed * dt
    BlockLevels.Blevel1.B2.y = BlockLevels.Blevel1.B2.y + blocks.speed * dt
    if BlockLevels.Blevel1.B1.y >= 60 then
      BlockLevels.Blevel2.B1.y = BlockLevels.Blevel2.B1.y + blocks.speed * dt
      BlockLevels.Blevel2.B2.y = BlockLevels.Blevel2.B2.y + blocks.speed * dt
    end
    if BlockLevels.Blevel2.B1.y >= 130 then
      BlockLevels.Blevel3.B1.y = BlockLevels.Blevel3.B1.y + blocks.speed * dt
      BlockLevels.Blevel3.B2.y = BlockLevels.Blevel3.B2.y + blocks.speed * dt
    end
    if BlockLevels.Blevel3.B1.y >= 80 then
      BlockLevels.Blevel4.B1.y = BlockLevels.Blevel4.B1.y + blocks.speed * dt
      BlockLevels.Blevel4.B2.y = BlockLevels.Blevel4.B2.y + blocks.speed * dt
      BlockLevels.Blevel4.B3.y = BlockLevels.Blevel4.B3.y + blocks.speed * dt
      if BlockLevels.Blevel4.B2.y >= 800 then
        wave = wave + 1 
      end
    end
  end
  if (wave%2) == 0 then
    
    BlockLevels.Blevel1.B1.x = BlockLevels.Blevel1.B1.x + blocks.speed * dt
    BlockLevels.Blevel1.B2.x = BlockLevels.Blevel1.B2.x + blocks.speed * dt
      if BlockLevels.Blevel1.B1.x >= 60 then
        BlockLevels.Blevel2.B1.x = BlockLevels.Blevel2.B1.x + blocks.speed * dt
        BlockLevels.Blevel2.B2.x = BlockLevels.Blevel2.B2.x + blocks.speed * dt
      end
      if BlockLevels.Blevel2.B1.x >= 130 then
        BlockLevels.Blevel3.B1.x = BlockLevels.Blevel3.B1.x + blocks.speed * dt
        BlockLevels.Blevel3.B2.x = BlockLevels.Blevel3.B2.x + blocks.speed * dt
      end
      if BlockLevels.Blevel3.B1.x >= 150 then
        BlockLevels.Blevel4.B1.x = BlockLevels.Blevel4.B1.x + blocks.speed * dt
        BlockLevels.Blevel4.B2.x = BlockLevels.Blevel4.B2.x + blocks.speed * dt
        BlockLevels.Blevel4.B3.x = BlockLevels.Blevel4.B3.x + blocks.speed * dt
        if BlockLevels.Blevel4.B1.x >= 900 then
           wave = wave + 1 
        end
      end
    end
  end

function love.graphics.drawcenter(Image,x,y)
   local scale = pulse(0)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,scale,scale,OriginX,OriginY)
end

function blocks:draw()

  love.graphics.drawcenter(BlockLevels.Blevel1.B1.Sprite,BlockLevels.Blevel1.B1.x,BlockLevels.Blevel1.B1.y)
  love.graphics.drawcenter(BlockLevels.Blevel1.B2.Sprite,BlockLevels.Blevel1.B2.x,BlockLevels.Blevel1.B2.y)
  love.graphics.drawcenter(BlockLevels.Blevel2.B1.Sprite,BlockLevels.Blevel2.B1.x,BlockLevels.Blevel2.B1.y)
  love.graphics.drawcenter(BlockLevels.Blevel2.B2.Sprite,BlockLevels.Blevel2.B2.x,BlockLevels.Blevel2.B2.y)
  love.graphics.drawcenter(BlockLevels.Blevel3.B1.Sprite,BlockLevels.Blevel3.B1.x,BlockLevels.Blevel3.B1.y)
  love.graphics.drawcenter(BlockLevels.Blevel3.B2.Sprite,BlockLevels.Blevel3.B2.x,BlockLevels.Blevel3.B2.y)
  love.graphics.drawcenter(BlockLevels.Blevel4.B1.Sprite,BlockLevels.Blevel4.B1.x,BlockLevels.Blevel4.B1.y)
  love.graphics.drawcenter(BlockLevels.Blevel4.B2.Sprite,BlockLevels.Blevel4.B2.x,BlockLevels.Blevel4.B2.y)
  love.graphics.drawcenter(BlockLevels.Blevel4.B3.Sprite,BlockLevels.Blevel4.B3.x,BlockLevels.Blevel4.B3.y)
end

return blocks