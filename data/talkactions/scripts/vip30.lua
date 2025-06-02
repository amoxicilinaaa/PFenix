 function onSay(cid, words, param, channel)
if getPlayerItemCount(cid, 2145) >= 10 then
doPlayerAddPremiumDays(cid, 30)
doPlayerRemoveItem(cid, 2145, 10)
		        doCreatureExecuteTalkAction(cid, "/salvar")
return doPlayerSendTextMessage(cid, 23, "Voce comprou 30 dias vip")
else 
doPlayerSendTextMessage(cid, 23, "Você não tem diamantes suficientes.")
return true 
end
end