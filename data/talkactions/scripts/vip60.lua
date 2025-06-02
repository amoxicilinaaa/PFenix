 function onSay(cid, words, param, channel)
if getPlayerItemCount(cid, 2145) >= 18 then
doPlayerAddPremiumDays(cid, 60)
doPlayerRemoveItem(cid, 2145, 18)
		        doCreatureExecuteTalkAction(cid, "/salvar")
return doPlayerSendTextMessage(cid, 23, "Voce comprou 60 dias vip")
else 
doPlayerSendTextMessage(cid, 23, "Você não tem diamantes suficientes.")
return true 
end
end