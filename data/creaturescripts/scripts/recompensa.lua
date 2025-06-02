function onAdvance(cid, skill, oldLevel, newLevel)

local config = {
[200] = {item = 24149, count = 1},
[201] = {item = 24149, count = 1},
[202] = {item = 24149, count = 1},
[203] = {item = 24149, count = 1},
[204] = {item = 24149, count = 1},
[205] = {item = 24149, count = 1},
[206] = {item = 24149, count = 1},
[207] = {item = 24149, count = 1},
[208] = {item = 24149, count = 1},
[209] = {item = 24149, count = 1},

[210] = {item = 24149, count = 1},
[211] = {item = 24149, count = 1},
[212] = {item = 24149, count = 1},
[213] = {item = 24149, count = 1},
[214] = {item = 24149, count = 1},
[215] = {item = 24149, count = 1},
[216] = {item = 24149, count = 1},
[217] = {item = 24149, count = 1},
[218] = {item = 24149, count = 1},
[219] = {item = 24149, count = 1},

[220] = {item = 24149, count = 1},
[221] = {item = 24149, count = 1},
[222] = {item = 24149, count = 1},
[223] = {item = 24149, count = 1},
[224] = {item = 24149, count = 1},
[225] = {item = 24149, count = 1},
[226] = {item = 24149, count = 1},
[227] = {item = 24149, count = 1},
[228] = {item = 24149, count = 1},
[229] = {item = 24149, count = 1},

[230] = {item = 24149, count = 1},
[231] = {item = 24149, count = 1},
[232] = {item = 24149, count = 1},
[233] = {item = 24149, count = 1},
[234] = {item = 24149, count = 1},
[235] = {item = 24149, count = 1},
[236] = {item = 24149, count = 1},
[237] = {item = 24149, count = 1},
[238] = {item = 24149, count = 1},
[239] = {item = 24149, count = 1},

[240] = {item = 24149, count = 1},
[241] = {item = 24149, count = 1},
[242] = {item = 24149, count = 1},
[243] = {item = 24149, count = 1},
[244] = {item = 24149, count = 1},
[245] = {item = 24149, count = 1},
[246] = {item = 24149, count = 1},
[247] = {item = 24149, count = 1},
[248] = {item = 24149, count = 1},
[249] = {item = 24149, count = 1},

[250] = {item = 24149, count = 11},
}

if skill == 8 then
for level, info in pairs(config) do
if newLevel >= level and (getPlayerStorageValue(cid, 307009) == -1 or not (string.find(getPlayerStorageValue(cid, 307009), "'" .. level .. "'"))) then
doPlayerAddItem(cid, info.item, info.count)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns Treinador! "..getCreatureName(cid).." você recebeu recompensa por chegar ao level "..newLevel.."!")

local sat = getPlayerStorageValue(cid, 307009) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 307009) .. ",'" .. level .. "'" 
setPlayerStorageValue(cid, 307009, sat)
end
end
end

return TRUE
end