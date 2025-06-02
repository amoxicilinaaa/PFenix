

local storage = 18941
local uid = 15001

function onUse(cid, item, frompos, item2, topos)
	if (item.uid == uid) and (getPlayerStorageValue(cid,storage) < 1) then
	doPlayerSendTextMessage(cid,27, "Voce pegou o Elmo Supremo")
	doPlayerAddItem(cid,10316,1)
		setPlayerStorageValue(cid,storage,1)
	else
		doPlayerSendCancel(cid, "Voce ja pegou o Elmo Supremo.")
	end
	return true
end