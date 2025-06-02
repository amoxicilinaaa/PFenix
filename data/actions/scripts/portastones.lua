function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 400 then
        doTeleportThing(cid, {x=1729,y=738,z=9})
      else
         doPlayerSendCancel(cid, "Voce nao tem level 400+ para passar.")
       end
     return true 
end