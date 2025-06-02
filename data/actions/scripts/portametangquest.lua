function onUse(cid, item, frompos, item2, topos)
 
local level = 230 -- coloque o Level aqui
 
if getPlayerLevel(cid) >= level then
doTeleportThing(cid, topos)
doSendMagicEffect(topos, 29)
else
doPlayerSendTextMessage(cid, 22, "Você precisa ser level 230+ para fazer essa quest.")
end
 
return TRUE
end