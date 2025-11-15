local blocks = {}
blocks.__index = blocks
blocks.speed = 100
blocks.altx = -200
local wave = 1
local wv = 0
local showSquare = true
local physics = require("Scripts/Physics")
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
              width = 0,
              height = 0
         },    
         B2= {
             Sprite = Images[1],
             x = 746,
             y = -90,
             width = 0,
             height = 0
        } 
      },
      Blevel2 = { 
         B1 = {
             Sprite = Images[1],
             x = 160,
             y = -90,
             width = 0,
             height = 0
         },    
         B2= {
             Sprite = Images[1],
             x = 641,
             y = -90,
             width = 0,
             height = 0
        } 
      },
      Blevel3 = { 
         B1 = {
              Sprite = Images[2],
              x = 200,
              y = -90,
              width = 0,
              height = 0
         },    
         B2= {
             Sprite = Images[2],
             x = 601,
             y = -90,
             width = 0,
             height = 0
         } 
      },
      Blevel4 = { 
         B1 = {
              Sprite = Images[1],
              x = 55,
              y = -90,
              width = 0,
              height = 0
         },    
        B2 = {
             Sprite = Images[1],
             x = 746,
             y = -90,
             width = 0,
             height = 0
         },    
        B3= {
            Sprite = Images[1],
            x = 400,
            y = -90,
            width = 0,
            height = 0
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
      BlockLevels.Blevel3.B1.Sprite = Images[3]
      BlockLevels.Blevel3.B2.Sprite = Images[3]
      if wv == 4 then
        BlockLevels.Blevel1.B1.Sprite = Images[3]
        BlockLevels.Blevel1.B2.Sprite = Images[3]
        BlockLevels.Blevel2.B1.Sprite = Images[1]
        BlockLevels.Blevel2.B2.Sprite = Images[1]
      end
    end
    if (wv%2) ~= 0 then
      BlockLevels.Blevel3.B1.Sprite = Images[2]
      BlockLevels.Blevel3.B2.Sprite = Images[2]
      if wv == 3 then
        BlockLevels.Blevel2.B1.Sprite = Images[2]
        BlockLevels.Blevel2.B2.Sprite = Images[2]
        BlockLevels.Blevel4.B1.Sprite = Images[3]
        BlockLevels.Blevel4.B2.Sprite = Images[3]
      end
    end
  end
end
function blocks:new()
   local instance = setmetatable({},blocks)
   return instance
end
function blocks:update(dt)
  arrangeBlocks()
  waves(dt)
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

function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end
function blocks:draw()
--  if showSquare then
--    love.graphics.drawCenter(square.Sprite,square.x,square.y)
--  end
  love.graphics.drawCenter(BlockLevels.Blevel1.B1.Sprite,BlockLevels.Blevel1.B1.x,BlockLevels.Blevel1.B1.y)
  love.graphics.drawCenter(BlockLevels.Blevel1.B2.Sprite,BlockLevels.Blevel1.B2.x,BlockLevels.Blevel1.B2.y)
  love.graphics.drawCenter(BlockLevels.Blevel2.B1.Sprite,BlockLevels.Blevel2.B1.x,BlockLevels.Blevel2.B1.y)
  love.graphics.drawCenter(BlockLevels.Blevel2.B2.Sprite,BlockLevels.Blevel2.B2.x,BlockLevels.Blevel2.B2.y)
  love.graphics.drawCenter(BlockLevels.Blevel3.B1.Sprite,BlockLevels.Blevel3.B1.x,BlockLevels.Blevel3.B1.y)
  love.graphics.drawCenter(BlockLevels.Blevel3.B2.Sprite,BlockLevels.Blevel3.B2.x,BlockLevels.Blevel3.B2.y)
  love.graphics.drawCenter(BlockLevels.Blevel4.B1.Sprite,BlockLevels.Blevel4.B1.x,BlockLevels.Blevel4.B1.y)
  love.graphics.drawCenter(BlockLevels.Blevel4.B2.Sprite,BlockLevels.Blevel4.B2.x,BlockLevels.Blevel4.B2.y)
  love.graphics.drawCenter(BlockLevels.Blevel4.B3.Sprite,BlockLevels.Blevel4.B3.x,BlockLevels.Blevel4.B3.y)
end

return blocks