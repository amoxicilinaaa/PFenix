function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 300 then
        doTeleportThing(cid, {x=2311,y=298,z=11})
      else
         doPlayerSendCancel(cid, "Voce precisa ser level 300+ para acessar a quest.")
       end
     return true 
end