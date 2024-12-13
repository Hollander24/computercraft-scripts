-- Einstellungen
local width = 40    -- Breite der Minenfläche (x-Achse)
local length = 40   -- Länge der Minenfläche (z-Achse)
local depth = 20    -- Tiefe der Minenfläche (y-Achse)

-- Funktion, um einen Block vor der Turtle zu abbauen
function mineBlock()
    if turtle.detect() then
        turtle.dig()
    end
end

-- Funktion, um die Turtle in der X-Achse zu bewegen
function moveForward()
    mineBlock()
    if not turtle.forward() then
        turtle.dig()
        turtle.forward()
    end
end

-- Funktion, um die Turtle in die Z-Achse zu bewegen
function moveSideways()
    mineBlock()
    if not turtle.turnRight() then
        turtle.dig()
        turtle.turnRight()
    end
    if not turtle.forward() then
        turtle.dig()
        turtle.forward()
    end
    if not turtle.turnRight() then
        turtle.dig()
        turtle.turnRight()
    end
end

-- Funktion zum Abbauen der gesamten Fläche
function mineArea()
    for x = 1, width do
        for z = 1, length do
            for y = 1, depth do
                mineBlock()
                moveSideways()
            end
        end
    end
end

-- Funktion zum Abbauen der Fläche auf gewünschter Ebene
mineArea()
