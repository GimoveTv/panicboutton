Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('panicbutton:sendCoords')
AddEventHandler('panicbutton:sendCoords', function()

    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('panicButton:syncPosition', playerCoords)

end)

RegisterNetEvent('esx:setjob')
AddEventHandler('esx:setjob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('panicbutton:alarm')
AddEventHandler('panicbutton:alarm', function(playername, pos)

    if PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.name == 'police' then
        -- blip
        local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blip, 137)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 1.5)
        SetBlipColour(blip, 1)
        SetBlipAsShortRange(blip, false)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(playername)
        EndTextCommandSetBlipName(blip)

        -- nachricht
        ShowNotification('~b~' .. playername .. ' ~r~A besoin d\'aide ! Blips a été défini.')

        Citizen.Wait(5000)
        RemoveBlip(blip)

    end

end)


function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end