function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 53440
        STORAGE_VALUE = 53437
        ID_DO_PREMIO = 12344
		ID_DO_PREMIO2 = 2160
		ID_DO_PREMIO3 = 12349
		ID_DO_PREMIO4 = 2392
			ID_DO_PREMIO5 = 7731
        if getPlayerLevel(cid) >= 1 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Voce pegou seus itens iniciais. Boa sorte em sua jornada!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,100)
        doPlayerAddItem(cid,ID_DO_PREMIO2,3)
        doPlayerAddItem(cid,ID_DO_PREMIO3,100)
		doPlayerAddItem(cid,ID_DO_PREMIO4,100)
				doPlayerAddItem(cid,ID_DO_PREMIO5,1)
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