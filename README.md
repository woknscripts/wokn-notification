# wokn-notification

<img width="306" height="257" alt="image" src="https://github.com/user-attachments/assets/109683a6-d486-4d33-b6c8-83db18db4395" />









To make this notification your main notification through es_extended/client/functions.lua find the show notification function and replace it with the section below:

function ESX.ShowNotification(message, notifyType, length, title, position)
	return exports['wokn-notification']:Notify(notifyType or 'info', message)
end

