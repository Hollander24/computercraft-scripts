-- Setze die Seite für den Gas-Burning Generator und den Energy Cube korrekt
local gasGenerator = peripheral.wrap("back")  -- Beispiel: Gas-Burning Generator an der Rückseite
local energyCube = peripheral.wrap("right")  -- Beispiel: Energy Cube an der rechten Seite

-- Überprüfe, ob die Peripherie verbunden ist
if not gasGenerator then
    print("Gas-Burning Generator nicht gefunden!")
else
    -- Hole die Energieproduktion des Generators
    local energyProduced = gasGenerator.getEnergyProduced()  -- Ersetze dies mit der richtigen Methode, wenn notwendig
    print("Energie produziert: " .. energyProduced)
end

if not energyCube then
    print("Energy Cube nicht gefunden!")
else
    -- Hole die gespeicherte Energie im Energy Cube
    local energyStored = energyCube.getEnergyStored()
    print("Gespeicherte Energie im Energy Cube: " .. energyStored)
end
