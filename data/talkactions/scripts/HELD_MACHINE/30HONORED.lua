-- HELD MACHINE: 30 HONORED TOKEN TOKEN

local card_id = {13948, 13949, 13950, 13969, 13970, 13971, 13983, 13984, 13985} -- joga os id dos card aqui

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 30X HONORED TOKENS --
if getPlayerItemCount(cid, 24148) >= 30 then

-- REMOVE 30x HONORED TOKENS --
doPlayerRemoveItem(cid, 24148, 30)


--- ADD HELD ALEATORIO T1-T2-T3 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD MACHINE!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 30x Honored Tokens para fazer isso.")
return true
end
end