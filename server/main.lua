local ESX = exports['es_extended']:getSharedObject()

exports('Notify', function(source, type, message)
    TriggerClientEvent('wokn-notification:client:notify', source, type, message)
end)

ESX.RegisterServerCallback('wokn-notification:server:notify', function(source, cb, type, message)
    TriggerClientEvent('wokn-notification:client:notify', source, type, message)
    cb(true)
end)
