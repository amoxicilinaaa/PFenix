function onUse(cid, item, frompos, item2, topos, pos)
 
local addons = {21078}
local randomChance = math.random(1, 49)
 
if item2.itemid == 15119 then
doSendMagicEffect(getCreaturePosition(cid), 28)
doRemoveItem(item2.uid, 1)
doPlayerAddItem(cid, addons[randomChance], 1)
doPlayerSendTextMessage(cid, 27, "Você ganhou um Addon!")
return true
 
end
end