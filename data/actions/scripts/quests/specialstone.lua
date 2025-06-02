function onUse (cid,item,frompos,item2,topos)
pos = {x=1108, y=1282, z=8}

        UID_DO_BAU = 17007
        STORAGE_VALUE = 17007
        ID_DO_PREMIO = 22004 --special stone
		ID_DO_PREMIO2 = 2160 -- grana
		ID_DO_PREMIO3 = 11442 --water stone 
        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
     --   doTeleportThing(cid,pos)
		--doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens você pegou 30 TDS.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
		doPlayerAddItem(cid,ID_DO_PREMIO2,5)
		doPlayerAddItem(cid,ID_DO_PREMIO3,2)
		doPlayerAddItem(cid,ID_DO_PREMIO4,1)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 150+ pode fazer essa quest.')
        end
return 1
end