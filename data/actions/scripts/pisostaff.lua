function onStepIn(cid, item, position, fromPosition)
if isMonster(cid) then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), 2)
return true
end

if getPlayerGroupId(cid) == 1 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, 25, "ops você não é da staff!.")
doSendMagicEffect(getThingPos(cid), 2)
return false
end
doPlayerSendTextMessage(cid, 25, "Bem-vindo(a)!.")
doSendMagicEffect(getThingPos(cid), 12)
return true
end