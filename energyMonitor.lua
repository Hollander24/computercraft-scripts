-- Mekanism Energieüberwachung mit Monitor-Unterstützung
-- Verbindet den Computer mit Mekanism-Induction Matrix und einem Monitor

local energyPeripheral = peripheral.wrap("back") -- Ändere "back" auf die Position deines Induction Port
local monitor = peripheral.wrap("left") -- Der Monitor ist links am Computer angeschlossen

if not energyPeripheral then
    print("Keine Mekanism Energie-Peripherie gefunden!")
    return
end

if not monitor then
    print("Kein Monitor an der linken Seite gefunden!")
    return
end

-- Monitor konfigurieren
monitor.setTextScale(1) -- Textskalierung anpassen

while true do
    -- Energieinformationen abrufen
    local energyStored = energyPeripheral.getEnergyStored(RF) -- RF oder Joules
    local maxEnergy = energyPeripheral.getMaxEnergyStored()
    local percentage = (energyStored / maxEnergy) * 100

    -- Terminal-Ausgabe
    term.clear()
    term.setCursorPos(1, 1)
    print("Mekanism Energieüberwachung")
    print("---------------------------")
    print("Gespeicherte Energie: " .. energyStored .. " / " .. maxEnergy .. " RF")
    print(string.format("Kapazität: %.2f%%", percentage))

    if percentage < 20 then
        print("⚠️ WARNUNG: Energie unter 20%!")
    end

    -- Monitor-Ausgabe
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.write("Mekanism Energieüberwachung")
    monitor.setCursorPos(1, 2)
    monitor.write("---------------------------")
    monitor.setCursorPos(1, 3)
    monitor.write("Gespeicherte Energie:")
    monitor.setCursorPos(1, 4)
    monitor.write(energyStored .. " / " .. maxEnergy .. " RF")
    monitor.setCursorPos(1, 5)
    monitor.write(string.format("Kapazität: %.2f%%", percentage))
    
    if percentage < 20 then
        monitor.setCursorPos(1, 7)
        monitor.write("⚠️ WARNUNG: Energie niedrig!")
    end

    -- Aktualisierung alle 2 Sekunden
    sleep(2)
end
