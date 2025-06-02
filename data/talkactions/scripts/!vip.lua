function onSay(cid, words, param)pos = {x=2623, y=989, z=7}
if getCreatureCondition(cid, CONDITION_INFIGHT) then
doPlayerSendCancel(cid, "Você está em battle!")
else
doSendMagicEffect(getPlayerPosition(cid),19)
doPlayerSendCancel(cid,"Teleportado,Para a Area Vip!")
doTeleportThing(cid,pos)
end
return true
end