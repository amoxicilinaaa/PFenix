function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 159186) < 1 then
doPlayerSendTextMessage(cid,22,"Voce ganhou 5 Darkness Stones!")
local bag = doPlayerAddItem(cid, 11115, 1)
doAddContainerItem(bag, 11450, 5)
setPlayerStorageValue(cid, 159186, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o prêmio.")
end
return TRUE
end