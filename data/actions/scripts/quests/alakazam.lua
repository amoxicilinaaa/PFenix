function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 53501
        STORAGE_VALUE = 54429
        ID_DO_PREMIO = 11452

        if getPlayerLevel(cid) >= 100 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens voce pegou 5 enigma stones.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,5)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 100+')
        end
return 1
end