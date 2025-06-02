function onUse(cid, item, frompos, item2, topos)
 
local level = 180 -- coloque o Level aqui
 
if getPlayerLevel(cid) >= level then
doTeleportThing(cid, topos)
doSendMagicEffect(topos, 29)
else
doPlayerSendTextMessage(cid, 22, "Você Precisa De LEVEL 180+")
end
 
return TRUE
end