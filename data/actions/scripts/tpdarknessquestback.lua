-- Start Config --
local topos = {x=1332, y=820, z=9} -- Posição para onde o player será teleportado.
-- End Config --
 
function onUse(cid)
   if doTeleportThing(cid, topos) then
  doPlayerSendTextMessage(cid,20,"Fique feliz por sair vivo.") -- Menssagem que aparecerá para o player ao ser teleportado.
 end
end