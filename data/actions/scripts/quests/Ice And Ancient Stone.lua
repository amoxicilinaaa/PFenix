function onUse (cid,item,frompos,item2,topos)
--pos = {x=0, y=0, z=0}

        UID_DO_BAU = 8231
        STORAGE_VALUE = 8231
        ID_DO_PREMIO = 12244
		ID_DO_PREMIO2 = 11454

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
       -- doTeleportThing(cid,pos)
		--doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens você completou Ice and Ancient Stone Quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Level 150+')
        end
return 1
end