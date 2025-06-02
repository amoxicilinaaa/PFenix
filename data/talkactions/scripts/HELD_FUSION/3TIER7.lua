-- HELD FUSION: 3X FUSION TIER 7

local card_id = {13954, 13975, 13989} -- joga os id dos card aqui
local HFusionPointTier7 = 1234607

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 3X HELD FUSION POINTS --
if getPlayerStorageValue(cid, HFusionPointTier7) >= 3 then

-- REMOVE 3X HELD FUSION POINTS --
setPlayerStorageValue(cid, HFusionPointTier7, getPlayerStorageValue(cid, HFusionPointTier7) - 3)


--- ADD HELD ALEATORIO T7 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD FUSION!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 3x Held Fusion Points [Tier: 7] para fazer isso.")
return true
end
end