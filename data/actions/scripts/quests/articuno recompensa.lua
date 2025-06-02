function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 55800
        STORAGE_VALUE = 55700
        ID_DO_PREMIO1 = 12618
        ID_DO_PREMIO2 = 11454
        ID_DO_PREMIO3 = 2160
        ID_DO_PREMIO4 = 7439

        if getPlayerLevel(cid) >= 100 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Voce completou a Articuno quest!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO1, 3)
        doPlayerAddItem(cid,ID_DO_PREMIO2, 50)
        doPlayerAddItem(cid,ID_DO_PREMIO3, 30)
        doPlayerAddItem(cid,ID_DO_PREMIO4, 1)
              doPlayerAddExperience(cid, 1000000)  --premio
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Você já obteve sua recompensa.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente players level 250+ podem abrir este baú.')
        end
return 1
end