 function onSay(cid, words, param, channel)
if getPlayerItemCount(cid, 2145) >= 25 then
doPlayerAddPremiumDays(cid, 90)
doPlayerRemoveItem(cid, 2145, 25)
		        doCreatureExecuteTalkAction(cid, "/salvar")
return doPlayerSendTextMessage(cid, 23, "Voce comprou 60 dias vip")
else 
doPlayerSendTextMessage(cid, 23, "Você não tem diamantes suficientes.")
return true 
end
end