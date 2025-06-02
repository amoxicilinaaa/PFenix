function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 3601
        STORAGE_VALUE = 3601
        ID_DO_PREMIO = 20900
        ID_DO_PREMIO2 = 2160

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens você pegou sua Mag Stone!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
		doPlayerAddItem(cid,ID_DO_PREMIO2,5)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 150+ pode receber este premio')
        end
return 1
end