function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 3527
        STORAGE_VALUE = 3527
        ID_DO_PREMIO = 11443
        ID_DO_PREMIO2 = 11448

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens você completou a Bug And Venom Quest.") -- Msg que ira aparecer
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