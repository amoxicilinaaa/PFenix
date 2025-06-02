
function onStepIn(cid, item, position, fromPosition)
if isMonster(cid) then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), 2)
return true
end

if getPlayerGroupId(cid) == 1 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, 25, "Voce Nao e Um Membro Da Staff!.")
doSendMagicEffect(getThingPos(cid), 2)
return false
end
doPlayerSendTextMessage(cid, 25, "Bem-vindo(a) a Area da Staff do Pokemon Roxy!.")
doSendMagicEffect(getThingPos(cid), 12)
return true
end