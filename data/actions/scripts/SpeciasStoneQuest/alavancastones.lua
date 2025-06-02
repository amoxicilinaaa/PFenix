function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 100 then
        doTeleportThing(cid, {x=1703,y=751,z=9})
      else
         doPlayerSendCancel(cid, "Voce nao tem level 100+ para poder puxar a alavanca.")
       end
     return true 
end