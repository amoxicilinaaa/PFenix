local config = {
storage = 102591,
}
local kevingay = {
ITEM = {2145, 10}, -- ITEM, QUANTIDADE
}




function onSay(cid, param, words, channel)

if getPlayerItemCount(cid, kevingay.ITEM[1]) >= kevingay.ITEM[2] then
setPlayerStorageValue(cid, config.storage, os.time()+param*60*60)
doPlayerRemoveMoney (cid, 2145, 10)
doBroadcastMessage("Voce comprou bonus de 50 por cento de exp durante "..param.." horas, por 10 diamonds! Aproveite.")
end
return true
end