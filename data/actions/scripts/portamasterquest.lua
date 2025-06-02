function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 400 then
        doTeleportThing(cid, {x=2125,y=227,z=7})
      else
         doPlayerSendCancel(cid, "Voce nao tem level 400 para passar.")
       end
     return true 
end