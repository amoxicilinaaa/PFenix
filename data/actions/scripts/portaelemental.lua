function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 300 then
        doTeleportThing(cid, {x=802,y=498,z=3})
      else
         doPlayerSendCancel(cid, "Voce nao tem level 300+ para passar.")
       end
     return true 
end