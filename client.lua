Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) then
            local roll = GetEntityRoll(vehicle)

            -- Als het voertuig ondersteboven of bijna ondersteboven staat, kunt u de auto niet meer kantelen
            if math.abs(roll) > 75 then
                -- Schakel de A/D- en W/S-control uit om te voorkomen dat u deze weer omdraait
                DisableControlAction(0, 59, true) -- Schakel A/D-voertuigbesturing uit. Dit moet worden uitgeschakeld in de lucht, niet op de grond
                DisableControlAction(0, 60, true) -- Schakel W/S uit om de auto naar voren of naar achteren te kantelen 
            end

            -- Schakel alle luchtcontrole uit wanneer het voertuig van de grond is
            if not IsVehicleOnAllWheels(vehicle) then
                DisableControlAction(0, 59, true) -- Schakel A/D control uit
                DisableControlAction(0, 60, true) -- Schakel W/S control uit
            end
        end
    end
end)
