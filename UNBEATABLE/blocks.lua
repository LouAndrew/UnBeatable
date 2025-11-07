local blocks = {}
blocks.__index = blocks
blocks.speed = 100
blocks.altx = -200
local wave = 1
local wv = 0
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
              height = 0,
              speed = 100,
              Xpos = {55,-120},
              Ypos = {-90,120}
         },    
         B2= {
             Sprite = Images[1],
             x = 746,
             y = -90,
             width = 0,
             height = 0,
             speed = 1000
        } 
      },
      Blevel2 = { 
         B1 = {
             Sprite = Images[1],
             x = 160,
             y = -90,
             width = 0,
             height = 0,
             speed = 100
         },    
         B2= {
             Sprite = Images[1],
             x = 641,
             y = -90,
             width = 0,
             height = 0,
             speed = 1000
        } 
      },
      Blevel3 = { 
         B1 = {
              Sprite = Images[2],
              x = 200,
              y = -90,
              width = 0,
              height = 0,
              speed = 100
         },    
         B2= {
             Sprite = Images[2],
             x = 601,
             y = -90,
             width = 0,
             height = 0,
             speed = 1000
         } 
      },
      Blevel4 = { 
         B1 = {
              Sprite = Images[1],
              x = 55,
              y = -90,
              width = 0,
              height = 0,
              speed = 100
         },    
        B2 = {
             Sprite = Images[1],
             x = 746,
             y = -90,
             --x=746,y=-90
             width = 0,
             height = 0,
             speed = 1000
         },    
        B3= {
            Sprite = Images[1],
            x = 400,
            y = -90,
            width = 0,
            height = 0,
            speed = 1000
         } 
      }
    }
function arrangeBlocks()
  local positions = { 
    {{55,-120},{-90,120}},{{746,-120},{-90,350}},
    {{160,-120},{-90,160}},{{641,-120},{-90,410}},
    {{200,-120},{-90,120}},{{601,-120},{-90,400}},
    {{55,-120},{-90,170}},{{746,-120},{-90,350}},{{400,-120},{-90,400}}
  }
  local i = 1
  local coordinates = 1
  local updatewv = false
  if wv ~= wave then
    updatewv = true
  end
  
  if wv ~= wave and updatewv == true then
    print(wv)
    BlockLevels.Blevel1.B1.x = positions[i][coordinates][wv]; BlockLevels.Blevel1.B1.y = positions[i][coordinates+1][wv]
    BlockLevels.Blevel1.B2.x = positions[i][coordinates][wv]; BlockLevels.Blevel1.B2.y = positions[i][coordinates+1][wv]

    BlockLevels.Blevel2.B1.x = positions[i+1][coordinates][wv]; BlockLevels.Blevel2.B1.y = positions[i+1][coordinates+1][wv]
    BlockLevels.Blevel2.B2.x = positions[i+1][coordinates][wv]; BlockLevels.Blevel2.B2.y = positions[i+1][coordinates+1][wv]

    BlockLevels.Blevel3.B1.x = positions[i+2][coordinates][wv]; BlockLevels.Blevel3.B1.y = positions[i+2][coordinates+1][wv]
    BlockLevels.Blevel3.B2.x = positions[i+2][coordinates][wv]; BlockLevels.Blevel3.B2.y = positions[i+2][coordinates+1][wv]

    BlockLevels.Blevel4.B1.x = positions[i+3][coordinates][wv]; BlockLevels.Blevel4.B1.y = positions[i+3][coordinates+1][wv]
    BlockLevels.Blevel4.B2.x = positions[i+3][coordinates][wv]; BlockLevels.Blevel4.B2.y = positions[i+3][coordinates+1][wv]
    BlockLevels.Blevel4.B3.x = positions[i+3][coordinates][wv]; BlockLevels.Blevel4.B3.y = positions[i+3][coordinates+1][wv]
    wv = wv + 1
    updatewv = false
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
  if wave == 1 then
    BlockLevels.Blevel1.B1.y = BlockLevels.Blevel1.B1.y + 100 * dt
    BlockLevels.Blevel1.B2.y = BlockLevels.Blevel1.B2.y + 100 * dt
    if BlockLevels.Blevel1.B1.y >= 60 then
      BlockLevels.Blevel2.B1.y = BlockLevels.Blevel2.B1.y + 100 * dt
      BlockLevels.Blevel2.B2.y = BlockLevels.Blevel2.B2.y + 100 * dt
    end
    if BlockLevels.Blevel2.B1.y >= 130 then
      BlockLevels.Blevel3.B1.y = BlockLevels.Blevel3.B1.y + 100 * dt
      BlockLevels.Blevel3.B2.y = BlockLevels.Blevel3.B2.y + 100 * dt
    end
    if BlockLevels.Blevel3.B1.y >= 80 then
      BlockLevels.Blevel4.B1.y = BlockLevels.Blevel4.B1.y + 100 * dt
      BlockLevels.Blevel4.B2.y = BlockLevels.Blevel4.B2.y + 100 * dt
      BlockLevels.Blevel4.B3.y = BlockLevels.Blevel4.B3.y + 100 * dt
      if BlockLevels.Blevel4.B3.y > 800 then
        wave = wave + 1 
      end
    end
  end
  if wave == 2 then
    BlockLevels.Blevel1.B1.x = BlockLevels.Blevel1.B1.x + 100 * dt
    BlockLevels.Blevel1.B2.x = BlockLevels.Blevel1.B2.x + 100 * dt
      if BlockLevels.Blevel1.B1.x >= 60 then
        BlockLevels.Blevel2.B1.x = BlockLevels.Blevel2.B1.x + 100 * dt
        BlockLevels.Blevel2.B2.x = BlockLevels.Blevel2.B2.x + 100 * dt
      end
      if BlockLevels.Blevel2.B1.x >= 130 then
        BlockLevels.Blevel3.B1.x = BlockLevels.Blevel3.B1.x + 100 * dt
        BlockLevels.Blevel3.B2.x = BlockLevels.Blevel3.B2.x + 100 * dt
      end
      if BlockLevels.Blevel3.B1.x >= 150 then
        BlockLevels.Blevel4.B1.x = BlockLevels.Blevel4.B1.x + 100 * dt
        BlockLevels.Blevel4.B2.x = BlockLevels.Blevel4.B2.x + 100 * dt
        BlockLevels.Blevel4.B3.x = BlockLevels.Blevel4.B3.x + 100 * dt
      end
    end
  end

function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end
function blocks:draw()
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
function love.graphics.drawCenter(Image,x,y)
   local OriginX = Image:getWidth()/2
   local OriginY = Image:getHeight()/2
   love.graphics.draw(Image,x,y,0,1,1,OriginX,OriginY)
end

return blocks