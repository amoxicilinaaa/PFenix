function onStepIn(cid, item, pos, fromPosition)
dota = {x=979, y=1088, z=13} -- Coordenadas do evento
if getGlobalStorageValue(cid, 8192) == 1 then
doTeleportThing(cid, dota)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Boa sorte no evento!")
else
doTeleportThing(cid, fromPosition)
doPlayerPopupFYI(cid, "O evento está fechado!")
end
return true
end