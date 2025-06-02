function onUse (cid,item,frompos,item2,topos)

        UID_DO_BAU = 3737
        STORAGE_VALUE = 3737
        ID_DO_PREMIO = 11443
        ID_DO_PREMIO2 = 11444
        ID_DO_PREMIO3 = 11445
        ID_DO_PREMIO4 = 11446
        ID_DO_PREMIO5 = 11447
        ID_DO_PREMIO6 = 11448
        ID_DO_PREMIO7 = 11449 --crystal
        ID_DO_PREMIO8 = 11450
        ID_DO_PREMIO9 = 11451
        ID_DO_PREMIO10 = 11452
        ID_DO_PREMIO11 = 11453
        ID_DO_PREMIO12 = 11454
        ID_DO_PREMIO13 = 11441
        ID_DO_PREMIO14 = 2160 --money
		ID_DO_PREMIO15 = 12232 -- metal
		   ID_DO_PREMIO16 = 12618 --boost
		 		   ID_DO_PREMIO17 = 12339 --boosted box
			ID_DO_PREMIO18 = 24148

        if getPlayerLevel(cid) >= 150 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
		  canDropOnMap = false
        doPlayerSendTextMessage(cid,22,"Parabens você completou a Golden Quest.") -- Msg que ira aparecer
		doPlayerAddItem(cid,ID_DO_PREMIO17,1)
		doPlayerAddItem(cid,ID_DO_PREMIO,20)
        doPlayerAddItem(cid,ID_DO_PREMIO2,20)
        doPlayerAddItem(cid,ID_DO_PREMIO3,20)
        doPlayerAddItem(cid,ID_DO_PREMIO4,20)
        doPlayerAddItem(cid,ID_DO_PREMIO5,20)
        doPlayerAddItem(cid,ID_DO_PREMIO6,20)
        doPlayerAddItem(cid,ID_DO_PREMIO7,10)
        doPlayerAddItem(cid,ID_DO_PREMIO8,20)
        doPlayerAddItem(cid,ID_DO_PREMIO9,20)
        doPlayerAddItem(cid,ID_DO_PREMIO10,20)
        doPlayerAddItem(cid,ID_DO_PREMIO11,20)
        doPlayerAddItem(cid,ID_DO_PREMIO12,20)
        doPlayerAddItem(cid,ID_DO_PREMIO13,20)
        doPlayerAddItem(cid,ID_DO_PREMIO14,30)
        doPlayerAddItem(cid,ID_DO_PREMIO15,10)
		doPlayerAddItem(cid,ID_DO_PREMIO16,5)
		doPlayerAddItem(cid,ID_DO_PREMIO18,1)
		
        setPlayerStorageValue(cid,STORAGE_VALUE,1)
          else
        doPlayerSendTextMessage(cid,22,"Ta vazio.")
          end
  end
        else
  doPlayerSendCancel(cid,'Somente Lvl 150+ para fazer essa quest')
        end
return 1
end