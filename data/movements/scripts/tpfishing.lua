local pos = {x = 1024, y = 1037, z = 7}

function onStepIn(cid, item, position, fromPosition)
if isMonster(cid) then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), 2)
return true
end
if not isMonster(cid) then
doTeleportThing(cid, pos) 
doSendMagicEffect(getThingPos(cid), 21)
end
return true
end