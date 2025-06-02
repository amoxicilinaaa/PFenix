function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 3609
        STORAGE_VALUE = 3609
        ID_DO_PREMIO = 12618
        ID_DO_PREMIO2 = 7439
        ID_DO_PREMIO3 = 2160
        ID_DO_PREMIO4 = 11447
        ID_DO_PREMIO5 = 20904

        if getPlayerLevel(cid) >= 300 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens voce completou a Flame quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,10)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        doPlayerAddItem(cid,ID_DO_PREMIO3,5)
        doPlayerAddItem(cid,ID_DO_PREMIO4,10)
		doPlayerAddItem(cid,ID_DO_PREMIO5,1)
              doPlayerAddExperience(cid, 100000)  --premio
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