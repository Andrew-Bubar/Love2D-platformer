
local STI = require("sti")

require("player")

function love.load()

    Map = STI("maps/testLevel.lua", {"box2d"}) --loading the tiled map
    World = love.physics.newWorld(0, 0) --creating a world for box 2d
    Map:box2d_init(World) --adding world to the tile map
    Map.layers.solid.visible = false --making the hitBoxes invisable

    background = love.graphics.newImage("assets/background.png")

    player:load()
end

--updates every frame
function love.update(dt)
    World:update(dt)
    player:update(dt)
end

--the graphics being rendered
function love.draw()

    love.graphics.draw(background) --drawing the background

    Map:draw( 0, 0, 2, 2 ) --drawing the map I made in tiled
    love.graphics.push()
    love.graphics.scale(2, 2) --setting the scale to x2

    player.draw()

    love.graphics.pop()
end