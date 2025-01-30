Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) then
            local roll = GetEntityRoll(vehicle)

            
            if math.abs(roll) > 75 then
                
                DisableControlAction(0, 59, true) 
                DisableControlAction(0, 60, true) 
            end

            
            if not IsVehicleOnAllWheels(vehicle) then
                DisableControlAction(0, 59, true) 
                DisableControlAction(0, 60, true) 
            end
        end
    end
end)
