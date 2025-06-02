local pos = {x = 998, y = 1172, z = 15}

function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) then
doTeleportThing(cid, pos) 
doSendMagicEffect(getThingPos(cid), 37)
end
return true
end