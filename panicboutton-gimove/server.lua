ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('panicbutton', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then
        TriggerClientEvent('panicbutton:sendCoords', source)
    end
end)

RegisterServerEvent('panicButton:syncPosition')
AddEventHandler('panicButton:syncPosition', function(position)

    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('panicbutton:alarm', -1, xPlayer.getName(), position)
    
end)

print("")
print("[^5Panic Boutton^7] - by GimoveTv")
print("")