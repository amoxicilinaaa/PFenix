function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 3034
        STORAGE_VALUE = 19392
        ID_DO_PREMIO2 = 12681
        ID_DO_PREMIO3 = 2160
        ID_DO_PREMIO4 = 11441
        ID_DO_PREMIO5 = 11442
        ID_DO_PREMIO6 = 11443
        ID_DO_PREMIO7 = 11444
        ID_DO_PREMIO8 = 11445
        ID_DO_PREMIO9 = 11446
        ID_DO_PREMIO10 = 11447
        ID_DO_PREMIO11 = 11448
        ID_DO_PREMIO12 = 11449
        ID_DO_PREMIO13 = 11450
        ID_DO_PREMIO14 = 11451
        ID_DO_PREMIO15 = 11452
        ID_DO_PREMIO16 = 11453
        ID_DO_PREMIO17 = 11454
        ID_DO_PREMIO18 = 12232
        ID_DO_PREMIO19 = 12244

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabéns você terminou a OutlandMain Quest!!!") -- Msg que ira aparecer
        doPlayerAddItem(cid,ID_DO_PREMIO2,1)
        doPlayerAddItem(cid,ID_DO_PREMIO3,25)
        doPlayerAddItem(cid,ID_DO_PREMIO4,10)
        doPlayerAddItem(cid,ID_DO_PREMIO5,10)
        doPlayerAddItem(cid,ID_DO_PREMIO6,10)
        doPlayerAddItem(cid,ID_DO_PREMIO7,10)
        doPlayerAddItem(cid,ID_DO_PREMIO8,10)
        doPlayerAddItem(cid,ID_DO_PREMIO9,10)
        doPlayerAddItem(cid,ID_DO_PREMIO10,10)
        doPlayerAddItem(cid,ID_DO_PREMIO11,10)
        doPlayerAddItem(cid,ID_DO_PREMIO12,10)
        doPlayerAddItem(cid,ID_DO_PREMIO13,10)
        doPlayerAddItem(cid,ID_DO_PREMIO14,10)
        doPlayerAddItem(cid,ID_DO_PREMIO15,10)
        doPlayerAddItem(cid,ID_DO_PREMIO16,10)
        doPlayerAddItem(cid,ID_DO_PREMIO17,10)
        doPlayerAddItem(cid,ID_DO_PREMIO18,10)
        doPlayerAddItem(cid,ID_DO_PREMIO19,10)
              doPlayerAddExperience(cid, 200000)
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Quest lvl 150+')
        end
return 1
end