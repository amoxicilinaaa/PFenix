function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 33392
        STORAGE_VALUE = 595959
        ID_DO_PREMIO = 24177

        if getPlayerLevel(cid) >= 250 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Você encontrou a Blessed Sword.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Você já pegou a espada antes.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 100+')
        end
return 1
end