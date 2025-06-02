function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 53428
        STORAGE_VALUE = 53428
        ID_DO_PREMIO = 22049

        if getPlayerLevel(cid) >= 300 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens você pegou 20 Cepos De Madeira.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,20)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 300+')
        end
return 1
end