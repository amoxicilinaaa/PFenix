function onUse (cid,item,frompos,item2,topos)


        UID_DO_BAU = 3523
        STORAGE_VALUE = 3523
        ID_DO_PREMIO = 2160
        ID_DO_PREMIO2 = 11640

        if getPlayerLevel(cid) >= 50 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
      --  doTeleportThing(cid,pos)
		--doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,10)
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
              doPlayerAddExperience(cid, 100000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'So lvl 50 so')
        end
return 1
end