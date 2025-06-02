-- Start Config --
local topos = {x=723, y=673, z=9} -- Posição para onde o player será teleportado.
-- End Config --
 
function onUse(cid)
   if doTeleportThing(cid, topos) then
       doPlayerSendTextMessage(cid,20,"MUAHAHAHAHAHAHAHAH!") -- Menssagem que aparecerá para o player ao ser teleportado.
 end
end