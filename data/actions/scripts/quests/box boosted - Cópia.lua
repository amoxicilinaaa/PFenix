function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 4780
        STORAGE_VALUE = 10920
        ID_DO_PREMIO = 12832

        if getPlayerLevel(cid) >= 400 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens,Você completou a masterball quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,10)
              doPlayerAddExperience(cid, 10000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lv 400+')
        end
return 1
end