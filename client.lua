Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

function shopmenu()
    local elements = Config.shop
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'actions', {
        title    = 'Superette',
        align    = 'center',
        elements = elements
    }, function(data, menu)

        if data.current.value ~= nil then
            TriggerServerEvent("MP:buyitem", data.current.value, data.current.price)
        end

    end, function(data, menu)
        menu.close()
    end)
end

Citizen.CreateThread(function()
    if Config.Marker then
        Citizen.CreateThread(function()
            while true do
                for i = 1, #Config.coords, 1 do
                    local distance = #(GetEntityCoords(PlayerPedId()) - Config.coords[i].coordonee)
                    if distance < Config.DistanceMarker then
                        DrawMarker(29, Config.coords[i].coordonee, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 204, 204, 0, 100, false, true, 2, false, false, false, false)
                        if distance < 2 then
                            ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour ouvrir la boutique')

                            if IsControlJustReleased(0, 38) then
                                shopmenu()
                            end
                        end
                    end
                end
                Citizen.Wait(1)
            end
        end)
    else
        Citizen.CreateThread(function()
            while true do
                for i = 1, #Config.coords, 1 do
                    local distance = #(GetEntityCoords(PlayerPedId()) - Config.coords[i].coordonee)
                    if distance < 2 then
                        ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour ouvrir la boutique')

                        if IsControlJustReleased(0, 38) then
                            shopmenu()
                        end
                    end
                end
                Citizen.Wait(1)
            end
        end)

    end
end)

Citizen.CreateThread(function()
	for i = 1, #Config.coords, 1 do
		local blip = AddBlipForCoord(Config.coords[i].coordonee)

		SetBlipSprite(blip, 171)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 0.8)
		SetBlipColour(blip, 5)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Superette')
		EndTextCommandSetBlipName(blip)
	end

    for i = 1, #Config.ped, 1 do
        RequestModel(Config.ped[i].name)
        local pedHash = GetHashKey(Config.ped[i].name)
        local ped = CreatePed(7, pedHash, Config.ped[i].coords, Config.ped[i].heading, false, false)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
    end

end)