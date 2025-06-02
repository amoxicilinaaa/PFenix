function onSay(cid,words,param)

if doPlayerRemoveItem(cid,0,0)

doPlayerAddItem(cid,11442,2)

doPlayerAddItem(cid,11447,2)

doPlayerAddItem(cid,11441,2)

doCreatureSay(cid,"[AUTO-SHOP]: You just buy Leaf Stone 1x, Water Stone 1x, Fire Stone 1x. All this will cost 1 dollar!",TALKTYPE_ORANGE_1)

else

doCreatureSay(cid,"[AUTO-SHOP]: You do not have dollar to make the purchase.",TALKTYPE_ORANGE_1)

end

end