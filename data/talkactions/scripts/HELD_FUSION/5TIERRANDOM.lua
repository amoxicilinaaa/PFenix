-- HELD FUSION: 3X FUSION TIER 7

local card_id = {13948, 13949, 13950, 13951, 13952, 13953, 13954, 13969, 13970, 13971, 13972, 13973, 13974, 13975, 13983, 13984, 13985, 13986, 13987, 13988, 13989} -- joga os id dos card aqui
local HFusionPointTier5 = 1234605

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 5X HELD FUSION POINTS --
if getPlayerStorageValue(cid, HFusionPointTier5) >= 5 then

-- REMOVE 5X HELD FUSION POINTS --
setPlayerStorageValue(cid, HFusionPointTier5, getPlayerStorageValue(cid, HFusionPointTier5) - 5)


--- ADD HELD ALEATORIO T1 A T7 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD FUSION!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 5x Held Fusion Points [Tier: 5] para fazer isso.")
return true
end
end