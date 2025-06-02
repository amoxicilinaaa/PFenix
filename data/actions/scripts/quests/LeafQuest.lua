function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 3544
        STORAGE_VALUE = 3544

        if getPlayerLevel(cid) >= 0 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
     --   doTeleportThing(cid,pos)
		--doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Reporte esas quest para o adm ou ira tomar ban.") -- Msg que ira aparecer
       doPlayerAddItem(cid,ID_DO_PREMIO1,0)

              doPlayerAddExperience(cid, 10)
        setPlayerStorageValue(cid,STORAGE_VALUE,3544)
          else
        doPlayerSendTextMessage(cid,22,"")
          end
  end
        else
  doPlayerSendCancel(cid,'')
        end
return 1
end