TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent("MP:buyitem")
AddEventHandler("MP:buyitem", function(item, price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getAccount("cash").money > price then
        xPlayer.addInventoryItem(item, 1)
        xPlayer.removeAccountMoney("cash", price)
        xPlayer.showNotification("Tu viens d'acheté 1 " ..xPlayer.getInventoryItem(item).label.. " pour " ..price.. "$ !")
        cb(true)
    else
        xPlayer.showNotification("Tu n'a pas assez d'argent !")
    end
end)