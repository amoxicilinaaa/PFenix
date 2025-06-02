-- HELD MACHINE: 300 MIGHTY TOKEN

local card_id = {13949, 13950, 13951, 13952, 13953, 13970, 13971, 13972, 13973, 13974, 13984, 13985, 13986, 13987, 13988} -- joga os id dos card aqui

function onSay(cid, words, param)

if getPlayerLevel(cid) < 200 then
doPlayerSendTextMessage(cid, 26, "Você precisa ser nível 200+ para utilizar esse recurso.")
return true
end

-- 300X MIGHTY TOKENS --
if getPlayerItemCount(cid, 24150) >= 300 then

-- REMOVE 300X MIGHTY TOKENS --
doPlayerRemoveItem(cid, 24150, 300)


--- ADD HELD ALEATORIO T2-T3-T4-T5-T6 ---
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])

doSendAnimatedText(getThingPos(cid), "HELD MACHINE!", math.random(1, 255))

return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa de 300x Mighty Tokens para fazer isso.")
return true
end
end