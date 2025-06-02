function onUse(cid, item, frompos, item2, topos)

    -- if getPlayerStorageValue(cid, 990) >= 1 then
        -- doPlayerSendCancel(cid, "You can't use revive during gym battles.")
    -- return true
    -- end
    
    -- if getPlayerStorageValue(cid, 52481) >= 1 then
       -- return doPlayerSendCancel(cid, "You can't do that while a duel.") --alterado v1.6
    -- end
	
	    if getPlayerStorageValue(cid, 17000) >= 1 then
       return doPlayerSendCancel(cid, "Nao pode usar revive enquanto esta no Fly") --alterado v1.6
    end
	
		    if getPlayerStorageValue(cid, 17001) >= 1 then
       return doPlayerSendCancel(cid, "Nao pode usar revive enquanto esta no Ride") --alterado v1.6
    end
			    if getPlayerStorageValue(cid, 63215) >= 1 then
       return doPlayerSendCancel(cid, "Nao pode usar revive enquanto esta no Surf") --alterado v1.6
    end
                 --
    if item2.itemid <= 0 or not isPokeball(item2.itemid) then
        doPlayerSendCancel(cid, "Please, use revive only on pokeballs.")
    return true
    end

    for a, b in pairs (pokeballs) do
      if #getCreatureSummons(cid) <= 0 then
	  

           doTransformItem(item2.uid, b.on)
           doSetItemAttribute(item2.uid, "hp", 1)
           for c = 1, 15 do
               local str = "move"..c
               setCD(item2.uid, str, 0)
           end
           setCD(item2.uid, "control", 0)
           setCD(item2.uid, "blink", 0)  --alterado v1.6
           doSendMagicEffect(getThingPos(cid), 13)
           doRemoveItem(item.uid, 1)
           doCureBallStatus(getPlayerSlotItem(cid, 8).uid, "all")
           doCureStatus(cid, "all", true)
           cleanBuffs2(item2.uid)             --alterado v1.5
           return true
        end
    end

return true
end