function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 3502
        STORAGE_VALUE = 3502
        ID_DO_PREMIO = 11444

        if getPlayerLevel(cid) >= 80 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens,você completou a thunder quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,2)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 80+')
        end
return 1
end