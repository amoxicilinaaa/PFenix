local config = {
   TELEPORT_pos = {x = 1065, y = 1045, z = 6}, -- Posição do TP
   EVENT_pos = {x = 1068, y = 1057, z = 10}
}
 
function onSay(cid, param)
   local tp = getTileItemById(config.TELEPORT_pos, 1387)
 
   if tp.uid > 100 then
      doRemoveItem(tp.uid)
      doBroadcastMessage("Portal do evento foi fechado.")
   else
      doCreateTeleport(1387, config.EVENT_pos, config.TELEPORT_pos)
      doBroadcastMessage("Portal do evento foi aberto em saffron.")
   end
 
   return true
end