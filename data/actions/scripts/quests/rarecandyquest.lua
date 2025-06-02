function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 53427
        STORAGE_VALUE = 53427
        ID_DO_PREMIO = 6569

        if getPlayerLevel(cid) >= 200 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
      --  doTeleportThing(cid,pos)
		--doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Você encontrou 5 rare candys.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,5)
              doPlayerAddExperience(cid, 0)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 200+')
        end
return 1
end