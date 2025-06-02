local a = {
ITEM = {2145, 10}, -- ITEM, QUANTIDADE
}
function onSay(cid, words, param,channel)
if getPlayerItemCount(cid, a.ITEM[1]) >= a.ITEM[2] then
doPlayerAddItem(cid,1819,1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você 30 dias de VIP!")
doSendMagicEffect(getCreaturePosition(cid), 28)
doPlayerRemoveItem(cid, a.ITEM[1], a.ITEM[2])
else
doSendMagicEffect(getCreaturePosition(cid), 2)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Desculpe mas você não tem Diamonds suficientes para ativar sua account VIP.")
end
return TRUE
end