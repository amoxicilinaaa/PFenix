function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 53392
        STORAGE_VALUE = 955512
		STORAGES = 977712

        if getPlayerLevel(cid) >= 250 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGES)
          if queststatus == -1 and getPlayerStorageValue(cid, STORAGES) ~= 1 then
	doPlayerSendTextMessage(cid,22,"Voce tocou o corpo congelado de um lendario treinador pokemon anciao.")
	doSendMagicEffect(getThingPos(cid), 634)
        setPlayerStorageValue(cid,STORAGES,1)
          else
        doPlayerSendTextMessage(cid,22,"Voce ja tocou este treinador pokemon lendario.")
          end
  end
        else
  doPlayerSendCancel(cid,'Voce precisa de level 250+ para tocar o corpo de um treinador pokemon lendario.')
        end
return 1
end