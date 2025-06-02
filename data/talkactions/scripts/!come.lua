function onUse(cid,item,words,item2)
if getPlayerItemCount(cid, a.ITEM[1]) >= a.ITEM[2]>= a.ITEM[3]>= a.ITEM[4]>= a.ITEM[5]>= a.ITEM[6] then
doPlayerAddItem(cid,12344,50)
doPlayerAddItem2(cid,2392,50)
doPlayerAddItem3(cid,2160,3)
doPlayerAddItem4(cid,11447,1)
doPlayerAddItem5(cid,11441,1)
doPlayerAddItem6(cid,11442,1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você pegou seu kit.")
doSendMagicEffect(getCreaturePosition(cid), 28)
else
doSendMagicEffect(getCreaturePosition(cid), 2)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ja pegou seu kit.")
end
return false
end
