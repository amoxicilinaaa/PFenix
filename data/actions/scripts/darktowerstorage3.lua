

local storage = 18942
local uid = 15002

function onUse(cid, item, frompos, item2, topos)
	if (item.uid == uid) and (getPlayerStorageValue(cid,storage) < 1) then
	doPlayerSendTextMessage(cid,27, "Voce pegou o Escudo Supremo")
	doPlayerAddItem(cid,10364,1)
		setPlayerStorageValue(cid,storage,1)
	else
		doPlayerSendCancel(cid, "Voce ja pegou o Escudo Supremo.")
	end
	return true
end