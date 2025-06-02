function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 4639
        STORAGE_VALUE = 4639
        ID_DO_PREMIO = 12227 
        ID_DO_PREMIO2 = 14186

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens Viado!!!.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
        doPlayerAddItem(cid,ID_DO_PREMIO2,2)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente level 150+ pode abrir esse bau!!.')
        end
return 1
end
