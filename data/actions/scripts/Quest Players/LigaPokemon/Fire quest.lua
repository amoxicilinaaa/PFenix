function onUse (cid,item,frompos,item2,topos)


        UID_DO_BAU = 4649
        STORAGE_VALUE = 4649
        ID_DO_PREMIO = 11447

        if getPlayerLevel(cid) >= 40 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Você Achou Duas Fire Stone.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,2)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'So Lv 40+ Pode Passar Essa Quest.')
        end
return 1
end