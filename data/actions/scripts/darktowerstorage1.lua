

local storage = 18940
local uid = 15000

function onUse(cid, item, frompos, item2, topos)
	if (item.uid == 15000) and (getPlayerStorageValue(cid,storage) < 1) then
	doPlayerSendTextMessage(cid,27, "Voce pegou a Espada Suprema")
	doPlayerAddItem(cid,10313,1)
		setPlayerStorageValue(cid,storage,1)
	else
		doPlayerSendCancel(cid, "Voce ja pegou a Espada Suprema.")
	end
	return true
end