-- HELD MACHINE: 20 DEVOTED TOKEN

local card_id = {13948, 13949, 13969, 13970, 13983, 13984} -- joga os id dos card aqui

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 20X DEVOTED TOKENS --
if getPlayerItemCount(cid, 24149) >= 20 then

-- REMOVE 20X DEVOTED TOKENS --
doPlayerRemoveItem(cid, 24149, 20)


--- ADD HELD ALEATORIO T1-T2 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD MACHINE!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 20x Devoted Tokens para fazer isso.")
return true
end
end