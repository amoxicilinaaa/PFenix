function onUse(cid, item, frompos, item2, topos)

if not isStaff(cid) then
doPlayerSendTextMessage(cid,22,"Você precisa ser da Staff para passar!") return false end

doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, frompos, true)
return true
end