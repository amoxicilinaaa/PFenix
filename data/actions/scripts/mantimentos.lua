function onUse (cid,item,frompos,item2,topos)
pos = {x=1049, y=1045, z=7}

        UID_DO_BAU = 10900
        STORAGE_VALUE = 10900
        ID_DO_PREMIO = 12344
        ID_DO_PREMIO2 = 2392
        ID_DO_PREMIO3 = 12349

        if getPlayerLevel(cid) >= 5 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doTeleportThing(cid,pos)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Parabens.") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO,100)
		doPlayerAddItem(cid,ID_DO_PREMIO2,200)
        doPlayerAddItem(cid,ID_DO_PREMIO3,100)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Voce ja pegou seus itens iniciais.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente lvl 400+')
        end
return 1
end