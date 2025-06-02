function onUse (cid,item,frompos,item2,topos)
pos = {x=161, y=47, z=7}

        UID_DO_BAU = 53439
        STORAGE_VALUE = 53439
        ID_DO_PREMIO = 2580
        if getPlayerLevel(cid) >= 5 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Voce pegou sua Fishing Rod, aproveite!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
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