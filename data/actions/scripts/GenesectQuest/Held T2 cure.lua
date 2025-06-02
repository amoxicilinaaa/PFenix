function onUse (cid,item,frompos,item2,topos)
pos = {x=1049, y=1045, z=7}

        UID_DO_BAU = 53425
        STORAGE_VALUE = 53425
        ID_DO_PREMIO = 13985

        if getPlayerLevel(cid) >= 100 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doTeleportThing(cid,pos)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens você completou a genesect quest,e pegou Held Y-Cure Tier 3.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
              doPlayerAddExperience(cid, 0)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 100+')
        end
return 1
end