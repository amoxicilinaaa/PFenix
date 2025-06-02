function onLogout(cid)	if getPlayerStorageValue(cid, 17000) >= 1 then		
 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não pode deslogar no fly")	
 return false	
 end	
return true	end
