# wokn-notification

To make this notification your main notification through es_extended/client/functions.lua find the show notification function and replace it with the section below:

function ESX.ShowNotification(message, notifyType, length, title, position)
	return exports['wokn-notification']:Notify(notifyType or 'info', message)
end
