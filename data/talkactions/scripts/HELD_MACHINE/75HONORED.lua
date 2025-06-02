-- HELD MACHINE: 75 HONORED TOKEN TOKEN

local card_id = {13949, 13950, 13951, 13970, 13971, 13972, 13984, 13985, 13986} -- joga os id dos card aqui

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 75x HONORED TOKENS --
if getPlayerItemCount(cid, 24148) >= 75 then

-- REMOVE 75x HONORED TOKENS --
doPlayerRemoveItem(cid, 24148, 75)


--- ADD HELD ALEATORIO T2-T3-T4 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD MACHINE!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 75x Honored Tokens para fazer isso.")
return true
end
end