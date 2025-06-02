local config = {
   TELEPORT_pos = {x = 2610, y = 242, z = 7}, -- Posição do TP
   EVENT_pos = {x = 94, y = 1574, z = 6}
}
 
function onSay(cid, param)
   local tp = getTileItemById(config.TELEPORT_pos, 1387)
 
   if tp.uid > 100 then
      doRemoveItem(tp.uid)
      doBroadcastMessage("Virus Area fechada,o portal se deslocou daquele lugar.")
   else
      doCreateTeleport(1387, config.EVENT_pos, config.TELEPORT_pos)
      doBroadcastMessage("Abriu o portal da virus area,em algum lugar do mapa.")
   end
 
   return true
end