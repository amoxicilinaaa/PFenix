function onSay(cid, words, param, channel)

local tier1 = 1234601
local tier2 = 1234602
local tier3 = 1234603
local tier4 = 1234604
local tier5 = 1234605
local tier6 = 1234606
local tier7 = 1234607


txt = "   [CONTAGEM DE HELD FUSION POINTS]:\n\n\*Held Fusion Point (Tier: 1): "..getPlayerStorageValue(cid,tier1).."x\n\*Held Fusion Point (Tier: 2): " .. getPlayerStorageValue(cid,tier2) .. "x\n\*Held Fusion Point (Tier: 3): " .. getPlayerStorageValue(cid,tier3) .. "x\n\*Held Fusion Point (Tier: 4): " .. getPlayerStorageValue(cid,tier4) .. "x\n\*Held Fusion Point (Tier: 5): " .. getPlayerStorageValue(cid,tier5) .. "x\n\*Held Fusion Point (Tier: 6): " .. getPlayerStorageValue(cid,tier6) .. "x\n\*Held Fusion Point (Tier: 7): " .. getPlayerStorageValue(cid,tier7) .. "x"
doShowTextDialog(cid, 1949, txt)
	return true
	end

