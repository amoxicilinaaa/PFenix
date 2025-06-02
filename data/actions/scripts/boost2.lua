function onUse(cid, item, topos, item2, frompos)
local myball = getPlayerSlotItem(cid, 8)
local boost = getItemAttribute(myball.uid, "boost") or 0
local boosts = 0
if boost == 100 then
return doPlayerSendCancel(cid, "Sorry, is not possible.")