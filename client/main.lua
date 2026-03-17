local ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    Citizen.Wait(500)
    SendNUIMessage({
        action = 'setPosition',
        position = Config.Position
    })
end)

local function sendNotification(type, message)
    SendNUIMessage({
        action = 'notify',
        type = type,
        message = message
    })
end

exports('Notify', sendNotification)

RegisterNetEvent('wokn-notification:client:notify')
AddEventHandler('wokn-notification:client:notify', function(type, message)
    sendNotification(type, message)
end)

RegisterCommand('testnotify', function()
    sendNotification('success', 'This is a success notification!')
    SetTimeout(1800, function()
        sendNotification('error', 'This is an error notification!')
    end)
    SetTimeout(3600, function()
        sendNotification('info', 'This is an info notification!')
    end)
end, false)

ESX.ShowNotification = function(message, notifyType, length, title, position)
    local notifType = notifyType or 'info'
    if notifType ~= 'success' and notifType ~= 'error' and notifType ~= 'info' then
        notifType = 'info'
    end
    sendNotification(notifType, message)
end
