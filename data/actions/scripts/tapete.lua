local ITEM_IDS = {
[22107] = 22108,
[22108] = 22107
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
if(not ITEM_IDS[item.itemid]) then
return false
end


doTransformItem(item.uid, ITEM_IDS[item.itemid])
doDecayItem(item.uid)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
return true
end