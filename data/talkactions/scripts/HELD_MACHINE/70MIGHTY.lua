-- HELD MACHINE: 70 MIGHTY TOKEN

local card_id = {13948, 13949, 13950, 13969, 13970, 13971, 13983, 13984, 13985} -- joga os id dos card aqui

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 70X MIGHTY TOKENS --
if getPlayerItemCount(cid, 24150) >= 70 then

-- REMOVE 70X MIGHTY TOKENS --
doPlayerRemoveItem(cid, 24150, 70)


--- ADD HELD ALEATORIO T1-T2-T3 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD MACHINE!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 70x Mighty Tokens para fazer isso.")
return true
end
end