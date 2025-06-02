function onLogout(cid)	if getPlayerStorageValue(cid, 17001) >= 1 then		 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não pode deslogar no ride")	return false	end	return true	end
