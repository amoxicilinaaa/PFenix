function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 54555
        STORAGE_VALUE = 53432
        ID_DO_PREMIO = 2160
		 ID_DO_PREMIO2 = 22096
		 ID_DO_PREMIO3 = 11441

        if getPlayerLevel(cid) >= 100 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens voce pegou sua recompensa.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,5)
		doPlayerAddItem(cid,ID_DO_PREMIO2,1)
		doPlayerAddItem(cid,ID_DO_PREMIO3,10)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Voce ja pegou o premio em um dos valleys!")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 100+')
        end
return 1
end