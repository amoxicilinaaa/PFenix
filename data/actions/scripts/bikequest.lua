function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 3604
        STORAGE_VALUE = 3604
        ID_DO_PREMIO = 2160
		ID_DO_PREMIO2 = 15432 -- box +5

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens, você completou a quest e ganhou box 5 e mais 5 thds.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,5)
		doPlayerAddItem(cid,ID_DO_PREMIO2,1)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 150+')
        end
return 1
end