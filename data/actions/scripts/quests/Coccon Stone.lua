function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 53435
        STORAGE_VALUE = 53435
        ID_DO_PREMIO = 11448

        if getPlayerLevel(cid) >= 50 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens você ganhou 2 Coccon Stones.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,2)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 50+')
        end
return 1
end