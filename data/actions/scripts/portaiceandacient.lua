function onUse(cid, item, frompos, item2, topos)
 
local level = 100 -- coloque o Level aqui
 
if getPlayerLevel(cid) >= level then
doTeleportThing(cid, topos)
doSendMagicEffect(topos, 29)
else
doPlayerSendTextMessage(cid, 22, "Voce precisa ser level 100+ para fazer essa quest.")
end
 
return TRUE
end