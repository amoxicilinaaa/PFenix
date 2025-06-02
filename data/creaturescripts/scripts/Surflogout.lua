function onLogout(cid)	
if getPlayerStorageValue(cid, 75846) >= 1 then		 
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não pode deslogar no surf")	
return false	
end	
return true	
end
