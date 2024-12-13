-- Stellen Sie sicher, dass das Wired Modem korrekt angeschlossen ist
local modem = peripheral.wrap("back")  -- Angenommen, das Modem ist auf der Rückseite des Computers
modem.open(123)  -- Öffnet den Kanal 123 für die Kommunikation

-- Funktion zum Abrufen und Übertragen der Energieinformationen
function sendEnergyData()
    -- Hole die Energieinformationen vom Energy Cube
    local energyStored = energyCube.getEnergyStored()
    local energyCapacity = energyCube.getMaxEnergyStored()
    local energyProduced = gasGenerator.getEnergyProduced()

    -- Erstelle eine Nachricht
    local message = {
        stored = energyStored,
        capacity = energyCapacity,
        produced = energyProduced
    }

    -- Sende die Nachricht über das Modem
    modem.transmit(123, 0, message)  -- Überträgt die Nachricht auf Kanal 123
end

-- Funktion zum Empfangen von Energieinformationen auf einem anderen Computer
function receiveEnergyData()
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    -- Überprüfe, ob die Nachricht auf dem richtigen Kanal empfangen wurde
    if channel == 123 then
        print("Energieinformationen empfangen:")
        print("Gespeicherte Energie: " .. message.stored)
        print("Maximale Kapazität: " .. message.capacity)
        print("Energieproduktion: " .. message.produced)
    end
end

-- Hauptschleife für die Datenübertragung und -empfang
while true do
    sendEnergyData()  -- Sende die Daten an den anderen Computer
    receiveEnergyData()  -- Empfange und zeige die Daten an
    sleep(5)  -- Warte 5 Sekunden, bevor die nächsten Daten übertragen werden
end
