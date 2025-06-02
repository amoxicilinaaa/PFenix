local tpId = 1387
local tps = {
["Fossil Kabutops"] = {pos = {x=368, y=977, z=11}, toPos = {x=367, y=991, z=12}, time = 30},
}
 
function removeTp(tp)
local t = getTileItemById(tp.pos, tpId)
if t then
doRemoveItem(t.uid, 1)
doSendMagicEffect(tp.pos, CONST_ME_POFF)
end
end
 
function onDeath(cid)
local tp = tps[getCreatureName(cid)]
if tp then
doCreateTeleport(tpId, tp.toPos, tp.pos)
doCreatureSay(cid, "O teleport irá sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
addEvent(removeTp, tp.time*1000, tp)
end
return TRUE
end