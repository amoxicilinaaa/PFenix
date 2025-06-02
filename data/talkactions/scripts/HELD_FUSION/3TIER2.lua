-- HELD FUSION: 3X FUSION TIER 2

local card_id = {13949, 13970, 13984} -- joga os id dos card aqui
local HFusionPointTier2 = 1234602

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 3X HELD FUSION POINTS --
if getPlayerStorageValue(cid, HFusionPointTier2) >= 3 then

-- REMOVE 3X HELD FUSION POINTS --
setPlayerStorageValue(cid, HFusionPointTier2, getPlayerStorageValue(cid, HFusionPointTier2) - 3)


--- ADD HELD ALEATORIO T2 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD FUSION!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 3x Held Fusion Points [Tier: 2] para fazer isso.")
return true
end
end