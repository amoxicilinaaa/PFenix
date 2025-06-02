function onUse (cid,item,frompos,item2,topos)
pos = {x=1414, y=1121, z=8}

        UID_DO_BAU = 3518
        STORAGE_VALUE = 3518
        ID_DO_PREMIO = 10097

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Voce encontrou um Boneco de Vodoo amaldicoado!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Esta Quest é lvl 150+')
        end
return 1
end