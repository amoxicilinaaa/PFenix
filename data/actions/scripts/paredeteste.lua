function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=755, y=557, z=9, stackpos=1}
local tempo = 2*60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 8107 and item.itemid == 5074 and getpiece1.itemid == 1547 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
addEvent(doCreateItem, tempo, 1547, piece1pos)
addEvent(doTransformItem, tempo, item.uid,)
elseif item.uid == 8107 and item.itemid == 5074 then
doTransformItem(item.uid,item.itemid-1)
addEvent(doCreateItem, 2*60*1000, item.itemid, piece1pos)
else
doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end
return 1
end