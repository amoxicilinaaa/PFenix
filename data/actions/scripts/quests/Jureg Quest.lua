function onUse (cid,item,frompos,item2,topos)
pos = {x=1049, y=1045, z=7}

        UID_DO_BAU = 53430
        STORAGE_VALUE = 53430
        ID_DO_PREMIO = 22052	    --demonic outfit
        ID_DO_PREMIO2 = 15488       --mega box
        ID_DO_PREMIO3 = 6569		--rare candys

        if getPlayerLevel(cid) >= 200 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
      --  doTeleportThing(cid,pos)
		--doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens voce completou a Mega quest.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,1)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        doPlayerAddItem(cid,ID_DO_PREMIO3,10)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)		  
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 200+')
        end
return 1
end