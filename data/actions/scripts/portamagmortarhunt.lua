function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 250 then
        doTeleportThing(cid, {x=708,y=1667,z=7})
      else
         doPlayerSendCancel(cid, "Voce precisa ser level 250+ para passar.")
       end
     return true 
end