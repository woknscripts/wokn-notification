# wokn-notification

To make this notification your main notification through es_extended/client/functions.lua find the show notification function and replace it with the section below:

function ESX.ShowNotification(message, notifyType, length, title, position)
	return exports['wokn-notification']:Notify(notifyType or 'info', message)
end
<img width="306" height="257" alt="image" src="https://github.com/user-attachments/assets/518ed3ad-245c-4459-9719-74024e62ac5e" />
