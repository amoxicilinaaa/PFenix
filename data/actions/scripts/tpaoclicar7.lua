-- Start Config --
local topos = {x=2207, y=280, z=11} -- Posição para onde o player será teleportado.
-- End Config --
 
function onUse(cid)
   if doTeleportThing(cid, topos) then
  doPlayerSendTextMessage(cid,20,"...?") -- Menssagem que aparecerá para o player ao ser teleportado.
 end
end