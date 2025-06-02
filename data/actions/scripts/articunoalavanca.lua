function onUse (cid,item,frompos,item2,topos)
local teleport = {x=1599,y=1760,z=15}
local item1 = 24177


if getPlayerItemCount(cid, item1) >= 1 then
			doTeleportThing(cid, teleport)
else
			doPlayerSendTextMessage(cid, 23, "Você nao pode passar por aqui sem a Blessed Sword pois é muito perigoso.")
return true
end
end