function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 3605
        STORAGE_VALUE = 3605
        ID_DO_PREMIO = 2160
		ID_DO_PREMIO2 = 11450

        if getPlayerLevel(cid) >= 80 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens você pegou 1 darkness stone e 3 thds.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,3)
		doPlayerAddItem(cid,ID_DO_PREMIO2,1)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 150+ para pegar este premio')
        end
return 1
end