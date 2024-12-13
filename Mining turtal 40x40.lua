-- Mining-Turtle Script für CraftOS 1.9
-- Abbauen einer 40x40 Fläche und einer Tiefe von 20 Blöcken

local width = 40   -- Breite der Fläche (x-Achse)
local length = 40  -- Länge der Fläche (z-Achse)
local depth = 20   -- Tiefe der Fläche (y-Achse)

-- Funktion, um einen Block vor der Turtle abzubauen
function mineBlock()
    while turtle.detect() do
        turtle.dig()
    end
end

-- Funktion, um einen Block unter der Turtle abzubauen
function mineBelow()
    while turtle.detectDown() do
        turtle.digDown()
    end
end

-- Funktion, um die Turtle nach vorne zu bewegen
function moveForward()
    mineBlock()
    if not turtle.forward() then
        turtle.dig()
        turtle.forward()
    end
end

-- Funktion, um die Turtle nach unten zu bewegen
function moveDown()
    mineBelow()
    if not turtle.down() then
        turtle.digDown()
        turtle.down()
    end
end

-- Funktion, um die Turtle nach oben zu bewegen
function moveUp()
    if not turtle.up() then
        turtle.digUp()
        turtle.up()
    end
end

-- Funktion, um die Turtle nach hinten zu bewegen
function moveBack()
    turtle.turnLeft()
    turtle.turnLeft()
    moveForward()
    turtle.turnLeft()
    turtle.turnLeft()
end

-- Funktion, um die Turtle in der Breite zu bewegen (links oder rechts)
function moveSide()
    turtle.turnRight()
    moveForward()
    turtle.turnLeft()
end

-- Funktion, um das gesamte Gebiet abzubauen
function mineArea()
    for y = 1, depth do
        for x = 1, width do
            for z = 1, length do
                mineBlock()
                if z < length then
                    moveForward()
                end
            end
            if x < width then
                if x % 2 == 1 then
                    moveSide()
                else
                    moveBack()
                    moveSide()
                end
            end
        end
        if y < depth then
            moveDown()
        end
    end
end

-- Start des Abbaus
mineArea()
