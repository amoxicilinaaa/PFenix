local pos = {x = 974, y = 1081, z = 13}

function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) then
doTeleportThing(cid, pos) 
doSendMagicEffect(getThingPos(cid), 37)
end
return true
end