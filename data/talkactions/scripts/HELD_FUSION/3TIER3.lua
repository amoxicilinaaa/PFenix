-- HELD FUSION: 3X FUSION TIER 3

local card_id = {13950, 13971, 13985} -- joga os id dos card aqui
local HFusionPointTier3 = 1234603

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 3X HELD FUSION POINTS --
if getPlayerStorageValue(cid, HFusionPointTier3) >= 3 then

-- REMOVE 3X HELD FUSION POINTS --
setPlayerStorageValue(cid, HFusionPointTier3, getPlayerStorageValue(cid, HFusionPointTier3) - 3)


--- ADD HELD ALEATORIO T3 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD FUSION!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 3x Held Fusion Points [Tier: 3] para fazer isso.")
return true
end
end