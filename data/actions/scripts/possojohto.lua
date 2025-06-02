function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getPlayerLevel(cid) >= 1 then
        doTeleportThing(cid, {x=1965,y=1932,z=8})
      else
         doPlayerSendCancel(cid, "Eu Vo Cai.")
       end
     return true 
end