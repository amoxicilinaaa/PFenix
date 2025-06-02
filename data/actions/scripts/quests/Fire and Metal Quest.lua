function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 3527
        STORAGE_VALUE = 3527
        ID_DO_PREMIO = 11447
        ID_DO_PREMIO2 = 12232

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens você completou a Fire And Metal Stone Quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        doPlayerAddItem(cid,ID_DO_PREMIO3,1)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Lvl 150+ para fazer essa quest')
        end
return 1
end