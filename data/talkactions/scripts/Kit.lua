function onSay(cid,words,param)

if doPlayerRemoveMoney(cid,10000) == FALSE then
doPlayerAddItem(cid,11441,2)

doPlayerAddItem(cid,11442,2)

doPlayerAddItem(cid,11447,2)

doPlayerAddItem(cid,12344,20)

doPlayerAddItem(cid,2392,50)

doCreatureSay(cid,"[AUTO-KIT] Você pegou seu kit inicial.",TALKTYPE_ORANGE_1)

else

doCreatureSay(cid,"Você já pegou seu kit inicial.",TALKTYPE_ORANGE_1)

end

end