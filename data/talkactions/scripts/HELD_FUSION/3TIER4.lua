-- HELD FUSION: 3X FUSION TIER 4

local card_id = {13951, 13972, 13986} -- joga os id dos card aqui
local HFusionPointTier4 = 1234604

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 3X HELD FUSION POINTS --
if getPlayerStorageValue(cid, HFusionPointTier4) >= 3 then

-- REMOVE 3X HELD FUSION POINTS --
setPlayerStorageValue(cid, HFusionPointTier4, getPlayerStorageValue(cid, HFusionPointTier4) - 3)


--- ADD HELD ALEATORIO T4 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD FUSION!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 3x Held Fusion Points [Tier: 4] para fazer isso.")
return true
end
end